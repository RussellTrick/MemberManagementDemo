@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>Schools</h1>

        @if($errors->any())
            @foreach($errors->all() as $error)
                <div class="alert alert-danger" role="alert">
                    {{ $error }}
                </div>
            @endforeach
        @endif

        <div class="row">
            <div class="col-md-12">
                <a href="{{ route('schools.create') }}" class="btn btn-primary mb-3">Add New School</a>
            </div>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th class="min-width-185">ID</th>
                    <th class="min-width-185">Name</th>
                    <th class="min-width-185">Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($schools as $school)
                    <tr>
                        <td class="min-width-185">{{ $school->id }}</td>
                        <td class="min-width-185">{{ $school->name }}</td>
                        <td class="min-width-185">
                            <a href="{{ route('schools.show', $school->id) }}" class="btn btn-info">View</a>
                            <a href="{{ route('schools.edit', $school->id) }}" class="btn btn-info">Edit</a>
                            <form action="{{ route('schools.destroy', $school->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection
