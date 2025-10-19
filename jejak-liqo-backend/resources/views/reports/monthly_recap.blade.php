
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $title }}</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            font-size: 11px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #000;
            padding-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
        }
        .header h2 {
            margin: 5px 0;
            font-size: 16px;
            color: #666;
        }
        .section {
            margin: 30px 0;
            page-break-inside: avoid;
        }
        .section-title {
            background: #4472C4;
            color: white;
            padding: 10px;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin: 20px 0;
        }
        .stat-card {
            border: 2px solid #4472C4;
            padding: 15px;
            text-align: center;
        }
        .stat-card h3 {
            margin: 0;
            font-size: 28px;
            color: #4472C4;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $title }}</h1>
        <h2>{{ $subtitle }}</h2>
        <p>{{ $period }}</p>
    </div>

    <div class="stats-grid">
        <div class="stat-card">
            <h3>{{ $stats['total_meetings'] }}</h3>
            <p>Total Pertemuan</p>
        </div>
        <div class="stat-card">
            <h3>{{ $stats['total_groups'] }}</h3>
            <p>Total Kelompok</p>
        </div>
        <div class="stat-card">
            <h3>{{ $stats['total_mentees'] }}</h3>
            <p>Total Mentee</p>
        </div>
        <div class="stat-card">
            <h3>{{ $stats['total_mentors'] }}</h3>
            <p>Total Mentor</p>
        </div>
    </div>

    @foreach($groups as $group)
    <div class="section">
        <div class="section-title">
            {{ $group->group_name }} - {{ $group->mentor->full_name }}
        </div>

        @php
            $groupMeetings = $meetings->where('group_id', $group->id);
        @endphp

        @if($groupMeetings->count() > 0)
            <table>
                <thead>
                    <tr>
                        <th style="width: 5%;">No</th>
                        <th style="width: 12%;">Tanggal</th>
                        <th style="width: 35%;">Topik</th>
                        <th style="width: 8%;">Tipe</th>
                        <th style="width: 30%;">Tempat</th>
                        <th style="width: 10%;">Hadir</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($groupMeetings as $index => $meeting)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ \Carbon\Carbon::parse($meeting->meeting_date)->format('d M Y') }}</td>
                        <td>{{ $meeting->topic }}</td>
                        <td>{{ $meeting->meeting_type }}</td>
                        <td style="font-size: 9px;">{{ Str::limit($meeting->place, 40) }}</td>
                        <td style="text-align: center;">
                            {{ $meeting->attendances->where('status', 'Hadir')->count() }}/{{ $meeting->attendances->count() }}
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p style="text-align: center; color: #999; padding: 20px;">
                Tidak ada pertemuan pada periode ini
            </p>
        @endif
    </div>
    @endforeach

    <div style="margin-top: 40px; text-align: right; color: #666; font-size: 10px;">
        <p>Dicetak pada: {{ now()->format('d F Y H:i') }}</p>
        <p>JejakLiqo - Sistem Manajemen Mentoring</p>
    </div>
</body>
</html>