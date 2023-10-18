<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\School;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\Rule;


class SchoolApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $schools = School::all();
    
        return response()->json($schools);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all());

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $school = School::create($request->all());

        return response()->json(['message' => 'School created successfully', 'data' => $school], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(School $school)
    {
        return response()->json($school);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, School $school)
    {
        $validator = $this->validator($request->all(), $school);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
    
        $school->update($request->all());
    
        return response()->json(['message' => 'School updated successfully', 'data' => $school]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(School $school)
    {
        $school->delete();
    
        return response()->json(['message' => 'School deleted successfully']);
    }

    /**
     * Validate the request data.
     */
    protected function validator(array $data, $school = null)
    {
        $rules = [
            'name' => ['required', 'string', 'max:255'],
        ];

        if ($school) {
            $rules['name'][] = Rule::unique('schools')->ignore($school->id);
        } else {
            $rules['name'][] = 'unique:schools';
        }

        return Validator::make($data, $rules);
    }

    public function getMembersBySchool($schoolId)
    {
        $members = Member::where('school_id', $schoolId)->get();
        return response()->json($members);
    }
}
