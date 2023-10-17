<?php

namespace Database\Factories;

use App\Models\Member;
use App\Models\School;
use Illuminate\Database\Eloquent\Factories\Factory;

class MemberFactory extends Factory
{
    protected $model = Member::class;

    public function definition(): array
    {
        
        $schoolId = School::exists() ? School::inRandomOrder()->first()->id : School::factory()->create()->id;

        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'school_id' => $schoolId,
        ];
    }
}

