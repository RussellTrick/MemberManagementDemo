@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>School Details</h1>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">{{ $school->name }}</h5>
                <p class="card-text">ID: {{ $school->id }}</p>
                <a href="{{ route('schools.edit', $school->id) }}" class="btn btn-primary">Edit</a>
            </div>
        </div>
    </div>
@endsection
