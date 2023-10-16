<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\School;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $members = Member::all();
    
        return view('members.index', compact('members'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $schools = School::all();
        
        return view('members.create', compact('schools'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all());

        if ($validator->fails()) {
            return redirect('members/create')
                ->withErrors($validator)
                ->withInput();
        }

        Member::create($request->all());

        return redirect('members');
    }

    /**
     * Display the specified resource.
     */
    public function show(Member $member)
    {
        return view('members.show', compact('member'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Member $member)
    {
        return view('members.edit', compact('member'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Member $member)
    {
        $validator = $this->validator($request->all());

        if ($validator->fails()) {
            return redirect(route('members.edit', $member->id))
                ->withErrors($validator)
                ->withInput();
        }
    
        $member->update($request->all());
    
        return redirect('members')->with('success', 'member updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Member $member)
    {
        $member->delete();
    
        return redirect('members')->with('success', 'Member deleted successfully');
    }

    /**
     * Validate the request data.
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:members'],
            'school_id' => ['required', 'exists:schools,id'], 
        ]);
    }
}
