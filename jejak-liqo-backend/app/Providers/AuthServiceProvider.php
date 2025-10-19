<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\Announcement;
use App\Policies\AnnouncementPolicy;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        Announcement::class => AnnouncementPolicy::class,
        // Tambahkan model-policy lain di sini kalau ada
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();

        // Contoh Gate tambahan (opsional)
        // Gate::define('view-admin-dashboard', function ($user) {
        //     return $user->role === 'admin';
        // });
    }
}
