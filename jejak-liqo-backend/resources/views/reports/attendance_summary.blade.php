
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $title }}</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            font-size: 12px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            margin: 0;
            font-size: 18px;
        }
        .header p {
            margin: 5px 0;
            color: #666;
        }
        .stats-container {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
        }
        .stat-box {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
            border-radius: 5px;
            flex: 1;
            margin: 0 5px;
        }
        .stat-box h3 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .stat-box p {
            margin: 5px 0 0 0;
            color: #666;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4472C4;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .status-hadir { color: green; font-weight: bold; }
        .status-izin { color: orange; font-weight: bold; }
        .status-sakit { color: blue; font-weight: bold; }
        .status-alfa { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $title }}</h1>
        <p>Periode: {{ $period }}</p>
    </div>

    <div class="stats-container" style="margin-bottom: 30px;">
        <div class="stat-box">
            <h3>{{ $stats['hadir'] }}</h3>
            <p>Hadir ({{ $stats['percentage_hadir'] }}%)</p>
        </div>
        <div class="stat-box">
            <h3>{{ $stats['izin'] }}</h3>
            <p>Izin</p>
        </div>
        <div class="stat-box">
            <h3>{{ $stats['sakit'] }}</h3>
            <p>Sakit</p>
        </div>
        <div class="stat-box">
            <h3>{{ $stats['alfa'] }}</h3>
            <p>Alfa</p>
        </div>
        <div class="stat-box">
            <h3>{{ $stats['total'] }}</h3>
            <p>Total</p>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th style="width: 5%;">No</th>
                <th style="width: 12%;">Tanggal</th>
                <th style="width: 20%;">Kelompok</th>
                <th style="width: 25%;">Nama Mentee</th>
                <th style="width: 10%;">Status</th>
                <th style="width: 28%;">Keterangan</th>
            </tr>
        </thead>
        <tbody>
            @foreach($attendances as $index => $attendance)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ \Carbon\Carbon::parse($attendance->meeting->meeting_date)->format('d M Y') }}</td>
                <td>{{ $attendance->meeting->group->group_name }}</td>
                <td>{{ $attendance->mentee->full_name }}</td>
                <td class="status-{{ strtolower($attendance->status) }}">
                    {{ $attendance->status }}
                </td>
                <td>{{ $attendance->notes ?? '-' }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div style="margin-top: 30px; text-align: right; color: #666; font-size: 10px;">
        <p>Dicetak pada: {{ now()->format('d F Y H:i') }}</p>
    </div>
</body>
</html>