<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Super Admin
        User::create([
            'full_name' => 'Super Admin',
            'email' => 'superadmin@jejakliqo.com',
            'password' => Hash::make('password'),
            'role' => 'super_admin',
            'status' => 'active',
        ]);

        // Admin
        User::create([
            'full_name' => 'Admin JejakLiqo',
            'email' => 'admin@jejakliqo.com',
            'password' => Hash::make('password'),
            'role' => 'admin',
            'status' => 'active',
        ]);

        // Mentors
        User::factory(10)->create(['role' => 'mentor']);
    }
}