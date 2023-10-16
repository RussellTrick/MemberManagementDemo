@extends('layouts.app')

@section('content')
    <h1>Member Details</h1>

    <div>
        <p><strong>Name:</strong> {{ $member->name }}</p>
        <p><strong>Email:</strong> {{ $member->email }}</p>
        <p><strong>School:</strong> {{ $member->school->name }}</p>
    </div>
    <a href="{{ url('/members/' . $member->id . '/edit') }}">Edit</a>
    <form action="{{ url('/members/' . $member->id) }}" method="post">
        @csrf
        @method('DELETE')
        <button type="submit">Delete</button>
    </form>
@endsection
