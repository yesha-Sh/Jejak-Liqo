<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Meeting;
use App\Models\Attendance;
use App\Models\Group;
use App\Models\User;
use App\Models\Mentee;
use Barryvdh\DomPDF\Facade\Pdf;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ReportExport;
use Carbon\Carbon;

class ReportController extends Controller
{
    /**
     * Download report langsung (PDF atau Excel)
     */
    public function download(Request $request)
    {
        $request->validate([
            'type' => 'required|in:attendance_summary,meeting_activity,mentor_performance,group_progress,monthly_recap',
            'format' => 'required|in:pdf,xlsx',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
            'group_id' => 'nullable|exists:groups,id',
            'mentor_id' => 'nullable|exists:users,id',
        ]);

        $type = $request->type;
        $format = $request->input('format');
        $startDate = Carbon::parse($request->start_date);
        $endDate = Carbon::parse($request->end_date);

        // Get data berdasarkan tipe laporan
        $data = $this->getReportData($type, $startDate, $endDate, $request->group_id, $request->mentor_id);

        // Generate filename
        $filename = "Laporan_{$type}_{$startDate->format('Y-m-d')}_{$endDate->format('Y-m-d')}";

        if ($format === 'pdf') {
            return $this->generatePDF($type, $data, $filename);
        } else {
            return $this->generateExcel($type, $data, $filename);
        }
    }

    /**
     * Get data untuk laporan berdasarkan tipe
     */
    private function getReportData($type, $startDate, $endDate, $groupId = null, $mentorId = null)
    {
        switch ($type) {
            case 'attendance_summary':
                return $this->getAttendanceSummary($startDate, $endDate, $groupId, $mentorId);
            
            case 'meeting_activity':
                return $this->getMeetingActivity($startDate, $endDate, $groupId, $mentorId);
            
            case 'mentor_performance':
                return $this->getMentorPerformance($startDate, $endDate, $mentorId);
            
            case 'group_progress':
                return $this->getGroupProgress($startDate, $endDate, $groupId);
            
            case 'monthly_recap':
                return $this->getMonthlyRecap($startDate, $endDate);
            
            default:
                return [];
        }
    }

    /**
     * Laporan Kehadiran
     */
    private function getAttendanceSummary($startDate, $endDate, $groupId, $mentorId)
    {
        $query = Attendance::with(['meeting', 'mentee', 'meeting.group'])
            ->whereHas('meeting', function($q) use ($startDate, $endDate, $groupId, $mentorId) {
                $q->whereBetween('meeting_date', [$startDate, $endDate]);
                if ($groupId) {
                    $q->where('group_id', $groupId);
                }
                if ($mentorId) {
                    $q->where('mentor_id', $mentorId);
                }
            });

        $attendances = $query->get();

        // Hitung statistik
        $stats = [
            'total' => $attendances->count(),
            'hadir' => $attendances->where('status', 'Hadir')->count(),
            'izin' => $attendances->where('status', 'Izin')->count(),
            'sakit' => $attendances->where('status', 'Sakit')->count(),
            'alfa' => $attendances->where('status', 'Alfa')->count(),
        ];

        $stats['percentage_hadir'] = $stats['total'] > 0 
            ? round(($stats['hadir'] / $stats['total']) * 100, 2) 
            : 0;

        return [
            'title' => 'Laporan Kehadiran Mentee',
            'period' => $startDate->format('d M Y') . ' - ' . $endDate->format('d M Y'),
            'attendances' => $attendances,
            'stats' => $stats,
        ];
    }

    /**
     * Laporan Aktivitas Pertemuan
     */
    private function getMeetingActivity($startDate, $endDate, $groupId, $mentorId)
    {
        $query = Meeting::with(['group', 'mentor', 'attendances.mentee'])
            ->whereBetween('meeting_date', [$startDate, $endDate]);

        if ($groupId) {
            $query->where('group_id', $groupId);
        }
        if ($mentorId) {
            $query->where('mentor_id', $mentorId);
        }

        $meetings = $query->orderBy('meeting_date', 'desc')->get();

        return [
            'title' => 'Laporan Aktivitas Pertemuan',
            'period' => $startDate->format('d M Y') . ' - ' . $endDate->format('d M Y'),
            'meetings' => $meetings,
            'total_meetings' => $meetings->count(),
            'total_online' => $meetings->where('meeting_type', 'Online')->count(),
            'total_offline' => $meetings->where('meeting_type', 'Offline')->count(),
        ];
    }

    /**
     * Laporan Kinerja Mentor
     */
    private function getMentorPerformance($startDate, $endDate, $mentorId)
    {
        $query = User::where('role', 'mentor')
            ->with(['groups', 'meetings' => function($q) use ($startDate, $endDate) {
                $q->whereBetween('meeting_date', [$startDate, $endDate]);
            }]);

        if ($mentorId) {
            $query->where('id', $mentorId);
        }

        $mentors = $query->get()->map(function($mentor) {
            return [
                'name' => $mentor->full_name,
                'email' => $mentor->email,
                'total_groups' => $mentor->groups->count(),
                'total_meetings' => $mentor->meetings->count(),
                'meetings' => $mentor->meetings,
            ];
        });

        return [
            'title' => 'Laporan Kinerja Mentor',
            'period' => $startDate->format('d M Y') . ' - ' . $endDate->format('d M Y'),
            'mentors' => $mentors,
        ];
    }

    /**
     * Laporan Progress Kelompok
     */
    private function getGroupProgress($startDate, $endDate, $groupId)
    {
        $query = Group::with([
            'mentor',
            'mentees',
            'meetings' => function($q) use ($startDate, $endDate) {
                $q->whereBetween('meeting_date', [$startDate, $endDate]);
            }
        ]);

        if ($groupId) {
            $query->where('id', $groupId);
        }

        $groups = $query->get()->map(function($group) {
            $totalMeetings = $group->meetings->count();
            $totalMentees = $group->mentees->count();
            
            return [
                'name' => $group->group_name,
                'mentor' => $group->mentor->full_name,
                'total_mentees' => $totalMentees,
                'total_meetings' => $totalMeetings,
                'meetings' => $group->meetings,
                'mentees' => $group->mentees,
            ];
        });

        return [
            'title' => 'Laporan Progress Kelompok',
            'period' => $startDate->format('d M Y') . ' - ' . $endDate->format('d M Y'),
            'groups' => $groups,
        ];
    }

    /**
     * Rekap Bulanan (Format UPA PAS-PAA)
     */
    private function getMonthlyRecap($startDate, $endDate)
    {
        $meetings = Meeting::with(['group', 'mentor', 'attendances.mentee'])
            ->whereBetween('meeting_date', [$startDate, $endDate])
            ->orderBy('meeting_date', 'desc')
            ->get();

        $groups = Group::with(['mentor', 'mentees'])->get();

        $stats = [
            'total_meetings' => $meetings->count(),
            'total_groups' => $groups->count(),
            'total_mentees' => Mentee::count(),
            'total_mentors' => User::where('role', 'mentor')->count(),
        ];

        return [
            'title' => 'LAPORAN UPA PAS-PAA',
            'subtitle' => $startDate->format('F') . ' - ' . $endDate->format('F Y'),
            'period' => $startDate->format('d M Y') . ' - ' . $endDate->format('d M Y'),
            'meetings' => $meetings,
            'groups' => $groups,
            'stats' => $stats,
        ];
    }

    /**
     * Generate PDF
     */
    private function generatePDF($type, $data, $filename)
    {
        $pdf = Pdf::loadView("reports.{$type}", $data)
            ->setPaper('a4', 'portrait')
            ->setOption('margin-top', 10)
            ->setOption('margin-bottom', 10);

        return $pdf->download("{$filename}.pdf");
    }

    /**
     * Generate Excel
     */
    private function generateExcel($type, $data, $filename)
    {
        return Excel::download(
            new ReportExport($type, $data), 
            "{$filename}.xlsx"
        );
    }
}