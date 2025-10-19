<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class ReportExport implements WithMultipleSheets
{
    protected $type;
    protected $data;

    public function __construct($type, $data)
    {
        $this->type = $type;
        $this->data = $data;
    }

    public function sheets(): array
    {
        switch ($this->type) {
            case 'attendance_summary':
                return [
                    new AttendanceSummarySheet($this->data),
                    new AttendanceStatsSheet($this->data)
                ];
            
            case 'meeting_activity':
                return [new MeetingActivitySheet($this->data)];
            
            case 'mentor_performance':
                return [new MentorPerformanceSheet($this->data)];
            
            case 'group_progress':
                return [new GroupProgressSheet($this->data)];
            
            case 'monthly_recap':
                return [
                    new MonthlyRecapSheet($this->data),
                    new MonthlyStatsSheet($this->data)
                ];
            
            default:
                return [];
        }
    }
}

/**
 * Sheet: Laporan Kehadiran
 */
class AttendanceSummarySheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        return collect($this->data['attendances'])->map(function($attendance, $index) {
            return [
                'no' => $index + 1,
                'tanggal' => $attendance->meeting->meeting_date,
                'kelompok' => $attendance->meeting->group->group_name,
                'mentee' => $attendance->mentee->full_name,
                'status' => $attendance->status,
                'keterangan' => $attendance->notes ?? '-',
            ];
        });
    }

    public function headings(): array
    {
        return [
            'No',
            'Tanggal',
            'Kelompok',
            'Nama Mentee',
            'Status',
            'Keterangan'
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'size' => 12],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => ['rgb' => '4472C4']
                ],
                'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER],
            ],
        ];
    }

    public function title(): string
    {
        return 'Data Kehadiran';
    }
}

/**
 * Sheet: Statistik Kehadiran
 */
class AttendanceStatsSheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        $stats = $this->data['stats'];
        return collect([
            ['Status', 'Jumlah', 'Persentase'],
            ['Hadir', $stats['hadir'], $stats['percentage_hadir'] . '%'],
            ['Izin', $stats['izin'], round(($stats['izin']/$stats['total'])*100, 2) . '%'],
            ['Sakit', $stats['sakit'], round(($stats['sakit']/$stats['total'])*100, 2) . '%'],
            ['Alfa', $stats['alfa'], round(($stats['alfa']/$stats['total'])*100, 2) . '%'],
            ['TOTAL', $stats['total'], '100%'],
        ]);
    }

    public function headings(): array
    {
        return [];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => ['font' => ['bold' => true, 'size' => 12]],
            6 => ['font' => ['bold' => true]],
        ];
    }

    public function title(): string
    {
        return 'Statistik';
    }
}

/**
 * Sheet: Aktivitas Pertemuan
 */
class MeetingActivitySheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        return collect($this->data['meetings'])->map(function($meeting, $index) {
            return [
                'no' => $index + 1,
                'tanggal' => $meeting->meeting_date,
                'kelompok' => $meeting->group->group_name,
                'mentor' => $meeting->mentor->full_name,
                'topik' => $meeting->topic,
                'tempat' => $meeting->place,
                'tipe' => $meeting->meeting_type,
                'jumlah_hadir' => $meeting->attendances->where('status', 'Hadir')->count(),
                'total_mentee' => $meeting->attendances->count(),
            ];
        });
    }

    public function headings(): array
    {
        return [
            'No',
            'Tanggal',
            'Kelompok',
            'Mentor',
            'Topik',
            'Tempat',
            'Tipe',
            'Hadir',
            'Total'
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'size' => 12],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => ['rgb' => '70AD47']
                ],
            ],
        ];
    }

    public function title(): string
    {
        return 'Aktivitas Pertemuan';
    }
}

/**
 * Sheet: Kinerja Mentor
 */
class MentorPerformanceSheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        return collect($this->data['mentors'])->map(function($mentor, $index) {
            return [
                'no' => $index + 1,
                'nama' => $mentor['name'],
                'email' => $mentor['email'],
                'jumlah_kelompok' => $mentor['total_groups'],
                'jumlah_pertemuan' => $mentor['total_meetings'],
                'rata_rata_pertemuan' => $mentor['total_groups'] > 0 
                    ? round($mentor['total_meetings'] / $mentor['total_groups'], 2) 
                    : 0,
            ];
        });
    }

    public function headings(): array
    {
        return [
            'No',
            'Nama Mentor',
            'Email',
            'Jumlah Kelompok',
            'Total Pertemuan',
            'Rata-rata Pertemuan'
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'size' => 12],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => ['rgb' => '7030A0']
                ],
            ],
        ];
    }

    public function title(): string
    {
        return 'Kinerja Mentor';
    }
}

/**
 * Sheet: Progress Kelompok
 */
class GroupProgressSheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        return collect($this->data['groups'])->map(function($group, $index) {
            return [
                'no' => $index + 1,
                'nama_kelompok' => $group['name'],
                'mentor' => $group['mentor'],
                'jumlah_mentee' => $group['total_mentees'],
                'jumlah_pertemuan' => $group['total_meetings'],
                'mentee_aktif' => $group['mentees']->where('status', 'Aktif')->count(),
            ];
        });
    }

    public function headings(): array
    {
        return [
            'No',
            'Nama Kelompok',
            'Mentor',
            'Jumlah Mentee',
            'Total Pertemuan',
            'Mentee Aktif'
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'size' => 12],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => ['rgb' => 'FFC000']
                ],
            ],
        ];
    }

    public function title(): string
    {
        return 'Progress Kelompok';
    }
}

/**
 * Sheet: Rekap Bulanan
 */
class MonthlyRecapSheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        $rows = collect([
            ['LAPORAN UPA PAS-PAA'],
            [$this->data['subtitle']],
            [''],
        ]);

        // Data per kelompok
        foreach ($this->data['groups'] as $group) {
            $rows->push(['']);
            $rows->push(['Kelompok: ' . $group->group_name]);
            $rows->push(['Mentor: ' . $group->mentor->full_name]);
            $rows->push(['']);
            $rows->push(['No', 'Tanggal', 'Topik', 'Tempat', 'Tipe', 'Jumlah Hadir']);
            
            $meetings = $this->data['meetings']->where('group_id', $group->id);
            foreach ($meetings as $index => $meeting) {
                $rows->push([
                    $index + 1,
                    $meeting->meeting_date,
                    $meeting->topic,
                    $meeting->place,
                    $meeting->meeting_type,
                    $meeting->attendances->where('status', 'Hadir')->count()
                ]);
            }
        }

        return $rows;
    }

    public function headings(): array
    {
        return [];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => ['font' => ['bold' => true, 'size' => 16]],
            2 => ['font' => ['bold' => true, 'size' => 14]],
        ];
    }

    public function title(): string
    {
        return 'Rekap Bulanan';
    }
}

/**
 * Sheet: Statistik Bulanan
 */
class MonthlyStatsSheet implements FromCollection, WithHeadings, WithStyles, WithTitle
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        $stats = $this->data['stats'];
        return collect([
            ['Statistik', 'Jumlah'],
            ['Total Pertemuan', $stats['total_meetings']],
            ['Total Kelompok', $stats['total_groups']],
            ['Total Mentee', $stats['total_mentees']],
            ['Total Mentor', $stats['total_mentors']],
        ]);
    }

    public function headings(): array
    {
        return [];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => ['font' => ['bold' => true, 'size' => 12]],
        ];
    }

    public function title(): string
    {
        return 'Statistik';
    }
}