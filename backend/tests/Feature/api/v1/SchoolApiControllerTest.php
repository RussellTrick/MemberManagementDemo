<?php

namespace Tests\Feature\Api\V1;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\School;

class SchoolApiControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_schools()
    {
        $response = $this->getJson('/api/v1/schools');

        $response->assertStatus(200);
    }

    public function test_can_create_school()
    {
        $data = [
            'name' => 'Sample School',
        ];

        $response = $this->postJson('/api/v1/schools', $data);

        $response->assertStatus(201)
            ->assertJson(['message' => 'School created successfully']);
    }

    public function test_can_show_school()
    {
        $school = School::factory()->create();

        $response = $this->getJson('/api/v1/schools/' . $school->id);

        $response->assertStatus(200);
    }

    public function test_can_update_school()
    {
        $school = School::factory()->create();
        $data = [
            'name' => 'Updated School Name',
        ];

        $response = $this->putJson('/api/v1/schools/' . $school->id, $data);

        $response->assertStatus(200)
            ->assertJson(['message' => 'School updated successfully']);
    }

    public function test_can_delete_school()
    {
        $school = School::factory()->create();

        $response = $this->deleteJson('/api/v1/schools/' . $school->id);

        $response->assertStatus(200)
            ->assertJson(['message' => 'School deleted successfully']);
    }
}
