@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>Add New School</h1>

        <form method="POST" action="{{ route('schools.store') }}">
            @csrf

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}">
                @error('name')
                    <div class="alert alert-danger mt-2">{{ $message }}</div>
                @enderror
            </div>

            <button type="submit" class="btn btn-primary mt-3">Save School</button>
        </form>
    </div>
@endsection
