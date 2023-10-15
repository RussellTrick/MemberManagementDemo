@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>Schools</h1>

        <a href="{{ route('schools.create') }}" class="btn btn-primary mb-3">Add New School</a>

        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($schools as $school)
                    <tr>
                        <td>{{ $school->id }}</td>
                        <td>{{ $school->name }}</td>
                        <td>
                            <a href="{{ route('schools.edit', $school->id) }}" class="btn btn-sm btn-info">Edit</a>
                            <form action="{{ route('schools.destroy', $school->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection
