<?php

namespace Database\Factories;

use App\Models\Group;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Meeting>
 */
class MeetingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $group = Group::inRandomOrder()->first() ?? Group::factory();

        return [
            'group_id' => $group->id,
            'mentor_id' => $group->mentor_id,
            'meeting_date' => $this->faker->dateTimeBetween('-1 year', 'now'),
            'place' => $this->faker->address,
            'topic' => 'Materi: ' . $this->faker->sentence(3),
            'notes' => $this->faker->paragraph,
            'meeting_type' => $this->faker->randomElement(['Online', 'Offline']),
        ];
    }
}