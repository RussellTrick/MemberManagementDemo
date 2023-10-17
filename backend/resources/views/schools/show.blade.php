@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>{{ $school->name }}</h1>

        @if($errors->any())
            @foreach($errors->all() as $error)
                <div class="alert alert-danger" role="alert">
                    {{ $error }}
                </div>
            @endforeach
        @endif

        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Total Members: {{ $school->members->count() }}</h4>
                <p class="card-text">ID: {{ $school->id }}</p>
                <a href="{{ route('schools.edit', $school->id) }}" class="btn btn-primary">Edit</a>
            </div>
        </div>

        <div class="mt-4">
            <h2>Members in this School</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($school->members as $member)
                        <tr>
                            <td>{{ $member->name }}</td>
                            <td>{{ $member->email }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

