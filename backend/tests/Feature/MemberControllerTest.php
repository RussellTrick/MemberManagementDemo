<?php

use Tests\TestCase;
use App\Models\Member;
use App\Models\School;
use Illuminate\Foundation\Testing\RefreshDatabase;

class MemberControllerTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function it_can_list_all_members()
    {
        $response = $this->get('/members');

        $response->assertStatus(200);
    }

    /** @test */
    public function it_can_show_the_create_member_form()
    {
        $response = $this->get('/members/create');

        $response->assertStatus(200);
    }

/** @test */
    public function it_can_store_a_new_member()
    {
        $school = School::factory()->create();

        $data = [
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'school_id' => $school->id,
        ];

        $response = $this->post('/members', $data);

        $response->assertRedirect('/members');
        $this->assertDatabaseHas('members', $data);
    }

    

    /** @test */
    public function it_can_show_a_member_details()
    {
        $member = Member::factory()->create();

        $response = $this->get("/members/{$member->id}");

        $response->assertStatus(200);
    }

    /** @test */
    public function it_can_show_the_edit_member_form()
    {
        $member = Member::factory()->create();

        $response = $this->get("/members/{$member->id}/edit");

        $response->assertStatus(200);
    }

/** @test */
    public function it_can_update_a_member()
    {
        $member = Member::factory()->create();
        $school = School::factory()->create();

        $data = [
            'name' => 'Updated Name',
            'email' => 'updated@example.com',
            'school_id' => $school->id,
        ];

        $response = $this->put("/members/{$member->id}", $data);

        $response->assertRedirect('/members');
        $this->assertDatabaseHas('members', $data);
    }

    

    /** @test */
    public function it_can_delete_a_member()
    {
        $member = Member::factory()->create();

        $response = $this->delete("/members/{$member->id}");

        $response->assertRedirect('/members');
        $this->assertDatabaseMissing('members', ['id' => $member->id]);
    }

    /** @test */
    public function testCreateMemberValidation()
    {
        $response = $this->post('/members', [
            'name' => '',
            'email' => 'invalid-email',
            'school_id' => 999, 
        ]);

        $response->assertStatus(302);
        $response->assertSessionHasErrors(['name', 'email', 'school_id']);
    }

    /** @test */
    public function testEditMemberValidation()
    {
        $member = Member::factory()->create();
        $response = $this->put("/members/$member->id", [
            'name' => '',
            'email' => 'invalid-email',
            'school_id' => 999, 
        ]);

        $response->assertStatus(302);
        $response->assertSessionHasErrors(['name', 'email', 'school_id']);
    }

    /** @test */
    public function it_cannot_create_a_member_with_non_unique_email()
    {
        $existingMember = Member::factory()->create();

        $response = $this->post('/members', [
            'name' => 'John Doe',
            'email' => $existingMember->email,
            'school_id' => $existingMember->school_id,
        ]);

        $response->assertSessionHasErrors('email');
    }

}
