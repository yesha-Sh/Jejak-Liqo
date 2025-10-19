<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Group>
 */
class GroupFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'group_name' => 'Kelompok ' . $this->faker->unique()->word,
            'description' => $this->faker->sentence,
            'mentor_id' => User::where('role', 'mentor')->inRandomOrder()->first()->id ?? User::factory(['role' => 'mentor']),
        ];
    }
}