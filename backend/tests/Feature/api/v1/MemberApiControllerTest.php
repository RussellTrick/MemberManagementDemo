<?php

namespace Tests\Feature\Api\V1;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Member;
use App\Models\School;

class MemberApiControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_members()
    {
        $response = $this->getJson('/api/v1/members');

        $response->assertStatus(200);
    }

    public function test_can_create_member()
    {
        $school = School::factory()->create();

        $data = [
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'school_id' => $school->id,
        ];

        $response = $this->postJson('/api/v1/members', $data);

        $response->assertStatus(201)
            ->assertJson(['message' => 'Member created successfully']);
    }

    public function test_can_show_member()
    {
        $member = Member::factory()->create();

        $response = $this->getJson('/api/v1/members/' . $member->id);

        $response->assertStatus(200);
    }

    public function test_can_update_member()
    {
        $member = Member::factory()->create();
        $school = School::factory()->create();

        $data = [
            'name' => 'Updated Name',
            'email' => 'updated@example.com',
            'school_id' => $school->id,
        ];

        $response = $this->putJson('/api/v1/members/' . $member->id, $data);

        $response->assertStatus(200)
            ->assertJson(['message' => 'Member updated successfully']);
    }

    public function test_can_delete_member()
    {
        $member = Member::factory()->create();

        $response = $this->deleteJson('/api/v1/members/' . $member->id);

        $response->assertStatus(200)
            ->assertJson(['message' => 'Member deleted successfully']);
    }
}
