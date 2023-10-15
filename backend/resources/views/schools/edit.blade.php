@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>Edit School</h1>

        <form method="POST" action="{{ route('schools.update', $school->id) }}">
            @csrf
            @method('PUT')

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="{{ $school->name }}">
            </div>

            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
@endsection
