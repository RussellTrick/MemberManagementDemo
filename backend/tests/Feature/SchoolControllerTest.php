<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\School;

class SchoolControllerTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function it_can_create_a_school()
    {
        $response = $this->post('/schools', [
            'name' => 'Example School',
        ]);

        $response->assertRedirect('/schools');
        $this->assertDatabaseHas('schools', ['name' => 'Example School']);
    }

    /** @test */
    public function it_can_update_a_school()
    {
        $school = School::factory()->create();

        $response = $this->put("/schools/{$school->id}", [
            'name' => 'Updated School Name',
        ]);

        $response->assertRedirect('/schools');
        $this->assertDatabaseHas('schools', ['id' => $school->id, 'name' => 'Updated School Name']);
    }

    /** @test */
    public function it_can_delete_a_school()
    {
        $school = School::factory()->create();

        $response = $this->delete("/schools/{$school->id}");

        $response->assertRedirect('/schools');
        $this->assertDatabaseMissing('schools', ['id' => $school->id]);
    }
}
