<?php

namespace Tests\Unit;

use App\Models\Group;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class UserRelationshipTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function a_mentor_has_many_groups()
    {
        $mentor = User::factory()->create(['role' => 'mentor']);
        Group::factory(2)->create(['mentor_id' => $mentor->id]);

        $this->assertInstanceOf(Group::class, $mentor->groups->first());
        $this->assertCount(2, $mentor->groups);
    }
}