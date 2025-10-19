<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // Tidak ada service custom yang perlu kita daftarkan di sini untuk proyek JejakLiqo.
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Tidak ada logic booting yang perlu kita tambahkan.
    }
}