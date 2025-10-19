<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $title }}</title>
    <style>
        body { font-family: 'Arial', sans-serif; font-size: 12px; }
        .header { text-align: center; margin-bottom: 30px; }
        .header h1 { margin: 0; font-size: 18px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #FFC000; color: #333; }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $title }}</h1>
        <p>Periode: {{ $period }}</p>
    </div>

    <table>
        <thead>
            <td
                <th>No</th>
                <th>Nama Kelompok</th>
                <th>Mentor</th>
                <th>Jumlah Mentee</th>
                <th>Total Pertemuan</th>
            </tr>
        </thead>
        <tbody>
            @foreach($groups as $index => $group)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $group['name'] }}</td>
                <td>{{ $group['mentor'] }}</td>
                <td>{{ $group['total_mentees'] }}</td>
                <td>{{ $group['total_meetings'] }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>