<?php

namespace Database\Factories;

use App\Models\Group;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Mentee>
 */
class MenteeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'group_id' => Group::inRandomOrder()->first()->id ?? Group::factory(),
            'full_name' => $this->faker->name(),
            'nickname' => $this->faker->firstName(),
            'birth_date' => $this->faker->date(),
            'phone_number' => $this->faker->phoneNumber(),
            'activity_class' => 'Kelas ' . $this->faker->randomElement(['1 Liqo', '2 Liqo', '3 Liqo']),
            'hobby' => $this->faker->word(),
            'address' => $this->faker->address(),
            'status' => 'Aktif',
        ];
    }
}