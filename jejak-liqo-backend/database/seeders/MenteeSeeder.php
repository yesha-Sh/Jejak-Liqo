<?php

namespace Database\Seeders;

use App\Models\Mentee;
use Illuminate\Database\Seeder;

class MenteeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Mentee::factory(50)->create();
    }
}