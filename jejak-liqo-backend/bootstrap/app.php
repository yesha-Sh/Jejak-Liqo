<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request; // [TAMBAHAN]
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException; // [TAMBAHAN]
use App\Traits\ApiResponse; // [TAMBAHAN]

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php', // [TAMBAHAN] Menambahkan file rute API
        apiPrefix: 'api', // [TAMBAHAN] Menetapkan prefix default /api
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        // [PENYESUAIAN] Mendaftarkan alias untuk RoleMiddleware kita
        $middleware->alias([
            'role' => \App\Http\Middleware\RoleMiddleware::class,
        ]);
    })
    
    ->withExceptions(function (Exceptions $exceptions) {
        // [PENYESUAIAN] Mengatur agar semua error di rute API mengembalikan format JSON
        $exceptions->render(function (Throwable $e, Request $request) {
            if ($request->is('api/*')) {
                // Menggunakan ApiResponse trait agar format error konsisten
                $apiResponse = new class { use ApiResponse; };

                if ($e instanceof NotFoundHttpException) {
                    return $apiResponse->error('Resource tidak ditemukan.', 404);
                }

                // Anda bisa menambahkan penanganan error spesifik lainnya di sini
                // ...

                // Error umum (Server Error)
                $message = config('app.debug') ? $e->getMessage() : 'Terjadi kesalahan pada server.';
                return $apiResponse->error($message, 500);
            }
        });
    })->create();
    