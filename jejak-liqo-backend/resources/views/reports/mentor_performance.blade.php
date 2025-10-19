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
        th { background-color: #7030A0; color: white; }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $title }}</h1>
        <p>Periode: {{ $period }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Mentor</th>
                <th>Email</th>
                <th>Jumlah Kelompok</th>
                <th>Total Pertemuan</th>
            </tr>
        </thead>
        <tbody>
            @foreach($mentors as $index => $mentor)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $mentor['name'] }}</td>
                <td>{{ $mentor['email'] }}</td>
                <td>{{ $mentor['total_groups'] }}</td>
                <td>{{ $mentor['total_meetings'] }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>