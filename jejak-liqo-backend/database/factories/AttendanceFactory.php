<?php

namespace Database\Factories;

use App\Models\Meeting;
use App\Models\Mentee;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Attendance>
 */
class AttendanceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'meeting_id' => Meeting::factory(),
            'mentee_id' => Mentee::factory(),
            'status' => $this->faker->randomElement(['Hadir', 'Izin', 'Sakit', 'Alfa']),
            'notes' => $this->faker->sentence(),
        ];
    }
}