<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Member;
use App\Models\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class MemberApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $members = Member::all();
    
        return response()->json(['members' => $members]);
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

        $member = Member::create($request->all());

        return response()->json(['message' => 'Member created successfully', 'member' => $member], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Member $member)
    {
        return response()->json(['member' => $member]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Member $member)
    {
        $validator = $this->validator($request->all(), $member);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $member->update($request->all());

        return response()->json(['message' => 'Member updated successfully', 'member' => $member]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Member $member)
    {
        $member->delete();

        return response()->json(['message' => 'Member deleted successfully']);
    }

    /**
     * Validate the request data.
     */
    protected function validator(array $data, $member = null)
    {
        $rules = [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'school_id' => ['required', 'exists:schools,id'],
        ];

        // If $member is provided (for update), add unique rule
        if ($member) {
            $rules['email'][] = Rule::unique('members')->ignore($member->id);
        } else {
            // For create, apply normal unique rule
            $rules['email'][] = 'unique:members';
        }

        return Validator::make($data, $rules);
    }
}
