@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>Edit Member</h1>

        <form method="POST" action="{{ route('members.update', $member->id) }}">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $member->name) }}">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" value="{{ old('email', $member->email) }}">
            </div>

            <div class="mb-3">
                <label for="school_id" class="form-label">School</label>
                <select class="form-select" id="school_id" name="school_id">
                    @foreach($schools as $school)
                        <option value="{{ $school->id }}" {{ $school->id == $member->school_id ? 'selected' : '' }}>
                            {{ $school->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update Member</button>
        </form>
    </div>
@endsection
