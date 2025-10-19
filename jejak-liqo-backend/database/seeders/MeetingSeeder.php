<?php

namespace Database\Seeders;

use App\Models\Attendance;
use App\Models\Group;
use App\Models\Meeting;
use Illuminate\Database\Seeder;

class MeetingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $groups = Group::with('mentees')->get();

        foreach ($groups as $group) {
            Meeting::factory(10)->create([
                'group_id' => $group->id,
                'mentor_id' => $group->mentor_id,
            ])->each(function ($meeting) use ($group) {
                foreach ($group->mentees as $mentee) {
                    Attendance::factory()->create([
                        'meeting_id' => $meeting->id,
                        'mentee_id' => $mentee->id,
                    ]);
                }
            });
        }
    }
}