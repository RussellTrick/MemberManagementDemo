@extends('layouts.app')

@section('content')
    <h1>Create Member</h1>

    <form action="{{ url('/members') }}" method="post">
        @csrf
        <div>
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>
        </div>
        <div>
            <label for="school_id">School:</label>
            <select name="school_id" id="school_id" required>
                @foreach($schools as $school)
                <option value="{{ $school->id }}">{{ $school->name }}</option>
                @endforeach
            </select>
        </div>
        <button type="submit">Submit</button>
    </form>
@endsection
