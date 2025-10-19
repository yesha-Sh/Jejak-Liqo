
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
        .stats {
            margin: 20px 0;
            padding: 15px;
            background: #f5f5f5;
            border-radius: 5px;
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
            background-color: #70AD47;
            color: white;
        }
        .badge-online {
            background: #3498db;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 10px;
        }
        .badge-offline {
            background: #95a5a6;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $title }}</h1>
        <p>Periode: {{ $period }}</p>
    </div>

    <div class="stats">
        <p><strong>Total Pertemuan:</strong> {{ $total_meetings }}</p>
        <p><strong>Online:</strong> {{ $total_online }} | <strong>Offline:</strong> {{ $total_offline }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th style="width: 5%;">No</th>
                <th style="width: 10%;">Tanggal</th>
                <th style="width: 15%;">Kelompok</th>
                <th style="width: 15%;">Mentor</th>
                <th style="width: 30%;">Topik</th>
                <th style="width: 10%;">Tipe</th>
                <th style="width: 15%;">Tempat</th>
            </tr>
        </thead>
        <tbody>
            @foreach($meetings as $index => $meeting)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ \Carbon\Carbon::parse($meeting->meeting_date)->format('d M Y') }}</td>
                <td>{{ $meeting->group->group_name }}</td>
                <td>{{ $meeting->mentor->full_name }}</td>
                <td>{{ $meeting->topic }}</td>
                <td>
                    <span class="badge-{{ strtolower($meeting->meeting_type) }}">
                        {{ $meeting->meeting_type }}
                    </span>
                </td>
                <td style="font-size: 10px;">{{ Str::limit($meeting->place, 30) }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div style="margin-top: 30px; text-align: right; color: #666; font-size: 10px;">
        <p>Dicetak pada: {{ now()->format('d F Y H:i') }}</p>
    </div>
</body>
</html>