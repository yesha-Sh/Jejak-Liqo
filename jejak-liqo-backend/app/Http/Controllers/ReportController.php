<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Group;
use App\Models\Mentee;
use App\Models\Meeting;
use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;
use Barryvdh\DomPDF\Facade\Pdf;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Requests\GenerateReportRequest;
use App\Exports\ReportExport;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log; // <-- [PERBAIKAN] Tambahkan ini

class ReportController extends Controller
{
    use ApiResponse;

    /**
     * Download report based on type and filters.
     */
    public function download(GenerateReportRequest $request)
    {
        // [PERBAIKAN] Bungkus semua logika dengan try...catch
        try {
            $type = $request->input('type', 'attendance_summary');
            $format = $request->input('format', 'pdf');
            
            $data = $this->getReportData($request);

            // [PERBAIKAN] Cek jika data kosong
            if ($data->isEmpty()) {
                return $this->sendError(
                    'Data tidak ditemukan',
                    ['message' => 'Tidak ada data yang cocok dengan kriteria filter Anda untuk laporan ini.'],
                    404
                );
            }

            $title = $this->getReportTitle($type);
            $filename = str_slug($title) . '-' . date('Y-m-d-His') . '.' . $format;
            $view = 'reports.' . $type;
            
            $payload = [
                'title' => $title,
                'date' => Carbon::now()->format('d F Y'),
                'data' => $data,
                'filters' => $request->only(['start_date', 'end_date', 'group_id', 'mentor_id']),
            ];

            if ($format == 'pdf') {
                $pdf = Pdf::loadView($view, $payload)
                    ->setPaper('a4', 'landscape');
                
                return $pdf->download($filename);

            } elseif ($format == 'excel') {
                return Excel::download(new ReportExport($view, $payload), $filename);
            }

            // Fallback jika format tidak dikenal
            return $this->sendError('Format Tidak Valid', ['message' => 'Format file yang diminta tidak didukung.'], 400);

        } catch (\Exception $e) {
            // [PERBAIKAN] Tangkap SEMUA exception
            // Catat error untuk debugging
            Log::error('Gagal membuat laporan: ' . $e->getMessage(), [
                'trace' => $e->getTraceAsString(),
                'request' => $request->all()
            ]);

            // Kirim respons JSON yang jelas ke frontend
            return $this->sendError(
                'Gagal Membuat Laporan',
                ['error' => 'Terjadi kesalahan internal saat memproses laporan Anda. Silakan coba lagi nanti atau hubungi administrator.', 'detail' => $e->getMessage()],
                500
            );
        }
    }

    /**
     * Get data for the report.
     */
    private function getReportData(Request $request)
    {
        // [PERBAIKAN] Bungkus dengan try...catch untuk keamanan query
        try {
            $type = $request->input('type', 'attendance_summary');
            $startDate = $request->input('start_date');
            $endDate = $request->input('end_date');
            $groupId = $request->input('group_id');
            $mentorId = $request->input('mentor_id');

            // Default ke 30 hari terakhir jika tidak ada tanggal
            if (!$startDate) {
                $startDate = Carbon::now()->subDays(30)->toDateString();
            }
            if (!$endDate) {
                $endDate = Carbon::now()->toDateString();
            }
            
            $data = match ($type) {
                'attendance_summary' => $this->getAttendanceSummary($startDate, $endDate, $groupId, $mentorId),
                'meeting_activity' => $this->getMeetingActivity($startDate, $endDate, $groupId, $mentorId),
                'group_progress' => $this->getGroupProgress($groupId),
                'mentor_performance' => $this->getMentorPerformance($startDate, $endDate, $mentorId),
                'monthly_recap' => $this->getMonthlyRecap($startDate, $endDate),
                default => collect(),
            };
            
            return $data;

        } catch (\Exception $e) {
            Log::error('Gagal mengambil data laporan: ' . $e->getMessage());
            return collect(); // Kembalikan koleksi kosong agar ditangani oleh `download()`
        }
    }

    private function getReportTitle($type)
    {
        return match ($type) {
            'attendance_summary' => 'Laporan Rekapitulasi Kehadiran',
            'meeting_activity' => 'Laporan Aktivitas Pertemuan',
            'group_progress' => 'Laporan Progres Kelompok',
            'mentor_performance' => 'Laporan Kinerja Mentor',
            'monthly_recap' => 'Laporan Rekap Bulanan',
            default => 'Laporan Kustom',
        };
    }

    // --- METODE PENGAMBILAN DATA ---

    private function getAttendanceSummary($startDate, $endDate, $groupId, $mentorId)
    {
        // Ambil mentee dengan status dan grup mereka
        $query = Mentee::with(['group', 'user', 'attendances' => function ($q) use ($startDate, $endDate) {
                $q->whereBetween('date', [$startDate, $endDate]);
            }])
            ->where('status', 'active');
        
        if ($groupId) {
            $query->where('group_id', $groupId);
        }

        if ($mentorId) {
            $query->whereHas('group', function ($q) use ($mentorId) {
                $q->where('mentor_id', $mentorId);
            });
        }

        // Ambil semua mentee yang relevan
        $mentees = $query->get();

        // Ambil jumlah pertemuan dalam rentang tanggal
        $meetingsCountQuery = Meeting::whereBetween('date', [$startDate, $endDate]);
        if ($groupId) {
            $meetingsCountQuery->where('group_id', $groupId);
        }
        if ($mentorId) {
            $meetingsCountQuery->whereHas('group', function ($q) use ($mentorId) {
                $q->where('mentor_id', $mentorId);
            });
        }
        $totalMeetings = $meetingsCountQuery->count();

        // Proses data
        $summary = $mentees->map(function ($mentee) use ($totalMeetings) {
            $present = $mentee->attendances->where('status', 'present')->count();
            $absent = $mentee->attendances->where('status', 'absent')->count();
            $permit = $mentee->attendances->where('status', 'permit')->count();
            
            // Hitung persentase
            $percentage = $totalMeetings > 0 ? ($present / $totalMeetings) * 100 : 0;

            return [
                'mentee_name' => $mentee->user->name,
                'group_name' => $mentee->group->name,
                'total_meetings' => $totalMeetings,
                'present' => $present,
                'absent' => $absent,
                'permit' => $permit,
                'percentage' => round($percentage, 2) . '%',
            ];
        });

        return $summary;
    }

    private function getMeetingActivity($startDate, $endDate, $groupId, $mentorId)
    {
        $query = Meeting::with(['group.mentor', 'attendances'])
            ->whereBetween('date', [$startDate, $endDate]);

        if ($groupId) {
            $query->where('group_id', $groupId);
        }

        if ($mentorId) {
            $query->whereHas('group', function ($q) use ($mentorId) {
                $q->where('mentor_id', $mentorId);
            });
        }

        return $query->orderBy('date', 'desc')->get()->map(function ($meeting) {
            return [
                'date' => $meeting->date,
                'group_name' => $meeting->group->name,
                'mentor_name' => $meeting->group->mentor->name,
                'title' => $meeting->title,
                'description' => $meeting->description,
                'attendance_count' => $meeting->attendances->where('status', 'present')->count() . ' / ' . $meeting->group->mentees_count, // Asumsi ada mentees_count
            ];
        });
    }
    
    private function getGroupProgress($groupId)
    {
        $query = Group::with(['mentor', 'mentees.user', 'meetings']);

        if ($groupId) {
            $query->where('id', $groupId);
        }

        return $query->get()->map(function ($group) {
            $totalMeetings = $group->meetings->count();
            $avgAttendance = 0;
            if ($totalMeetings > 0 && $group->mentees->count() > 0) {
                $totalPresent = $group->meetings->reduce(function ($carry, $meeting) {
                    return $carry + $meeting->attendances->where('status', 'present')->count();
                }, 0);
                $avgAttendance = ($totalPresent / ($totalMeetings * $group->mentees->count())) * 100;
            }

            return [
                'group_name' => $group->name,
                'mentor_name' => $group->mentor->name,
                'total_mentees' => $group->mentees->count(),
                'total_meetings' => $totalMeetings,
                'avg_attendance' => round($avgAttendance, 2) . '%',
                'mentees' => $group->mentees->map(fn ($m) => $m->user->name)->implode(', '),
            ];
        });
    }

    private function getMentorPerformance($startDate, $endDate, $mentorId)
    {
        $query = User::where('role', 'mentor')
            ->with(['groups.meetings' => function ($q) use ($startDate, $endDate) {
                $q->whereBetween('date', [$startDate, $endDate]);
            }, 'groups.mentees']);

        if ($mentorId) {
            $query->where('id', $mentorId);
        }

        return $query->get()->map(function ($mentor) {
            $totalMeetings = 0;
            $totalMentees = 0;
            $totalPresent = 0;
            
            foreach ($mentor->groups as $group) {
                $totalMeetings += $group->meetings->count();
                $totalMentees += $group->mentees->count();
                foreach ($group->meetings as $meeting) {
                    $totalPresent += $meeting->attendances->where('status', 'present')->count();
                }
            }

            $avgAttendance = ($totalMeetings > 0 && $totalMentees > 0) 
                ? ($totalPresent / ($totalMeetings * $totalMentees)) * 100 
                : 0;

            return [
                'mentor_name' => $mentor->name,
                'total_groups' => $mentor->groups->count(),
                'total_meetings' => $totalMeetings,
                'total_mentees' => $totalMentees,
                'avg_attendance' => round($avgAttendance, 2) . '%',
            ];
        });
    }

    private function getMonthlyRecap($startDate, $endDate)
    {
        // Contoh rekap sederhana
        $totalUsers = User::count();
        $totalGroups = Group::count();
        $totalMentees = Mentee::where('status', 'active')->count();
        $totalMeetings = Meeting::whereBetween('date', [$startDate, $endDate])->count();
        $totalPresent = Attendance::whereBetween('date', [$startDate, $endDate])
            ->where('status', 'present')->count();
        $totalAbsent = Attendance::whereBetween('date', [$startDate, $endDate])
            ->where('status', 'absent')->count();

        return collect([
            (object) [
                'metric' => 'Total Pengguna',
                'value' => $totalUsers
            ],
            (object) [
                'metric' => 'Total Kelompok',
                'value' => $totalGroups
            ],
            (object) [
                'metric' => 'Total Mentee Aktif',
                'value' => $totalMentees
            ],
            (object) [
                'metric' => 'Total Pertemuan (periode)',
                'value' => $totalMeetings
            ],
            (object) [
                'metric' => 'Total Kehadiran (periode)',
                'value' => $totalPresent
            ],
            (object) [
                'metric' => 'Total Absen (periode)',
                'value' => $totalAbsent
            ],
        ]);
    }
}