<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $data['title'] ?? 'Laporan' }}</title>
    <style>
        body { font-family: sans-serif; margin: 40px; }
        .header { text-align: center; margin-bottom: 20px; }
        h1 { margin: 0; }
        .meta { margin-bottom: 20px; font-size: 0.9em; color: #555; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .footer { position: fixed; bottom: 0; width: 100%; text-align: center; font-size: 0.8em; color: #888; }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $data['title'] }}</h1>
        <p>JejakLiqo Mentoring System</p>
    </div>

    <div class="meta">
        <div><strong>Dibuat pada:</strong> {{ $data['generated_at'] }}</div>
        @if(!empty($data['filters']))
            <div><strong>Filter:</strong> {{ json_encode($data['filters']) }}</div>
        @endif
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Item</th>
                <th>Value</th>
            </tr>
        </thead>
        <tbody>
            @forelse($data['items'] as $item)
                <tr>
                    <td>{{ $item['id'] }}</td>
                    <td>{{ $item['name'] }}</td>
                    <td>{{ $item['value'] }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="3" style="text-align: center;">Tidak ada data.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <div class="footer">
        Halaman <span class="page-number"></span>
    </div>
</body>
</html>