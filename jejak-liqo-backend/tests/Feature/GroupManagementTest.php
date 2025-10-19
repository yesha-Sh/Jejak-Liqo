<?php

namespace Tests\Feature;

use App\Models\Group;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class GroupManagementTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        // Buat user admin untuk otentikasi
        $admin = User::factory()->create(['role' => 'admin']);
        Sanctum::actingAs($admin, ['*']);
    }

    /** @test */
    public function an_admin_can_create_a_group()
    {
        $mentor = User::factory()->create(['role' => 'mentor']);

        $response = $this->postJson('/api/groups', [
            'group_name' => 'Kelompok Tes',
            'description' => 'Deskripsi kelompok tes.',
            'mentor_id' => $mentor->id,
        ]);

        $response->assertStatus(201)
            ->assertJsonPath('success', true)
            ->assertJsonPath('data.group_name', 'Kelompok Tes');

        $this->assertDatabaseHas('groups', ['group_name' => 'Kelompok Tes']);
    }

    /** @test */
    public function an_admin_can_view_all_groups()
    {
        Group::factory(3)->create();

        $response = $this->getJson('/api/groups');

        $response->assertStatus(200)
            ->assertJsonPath('success', true)
            ->assertJsonCount(3, 'data');
    }

    /** @test */
    public function a_mentor_cannot_create_a_group()
    {
        $mentor = User::factory()->create(['role' => 'mentor']);
        Sanctum::actingAs($mentor);

        $response = $this->postJson('/api/groups', [
            'group_name' => 'Kelompok Gagal',
            'description' => 'Deskripsi kelompok gagal.',
            'mentor_id' => $mentor->id,
        ]);

        $response->assertStatus(403); // Forbidden
    }
}