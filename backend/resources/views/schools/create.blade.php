@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>Add New School</h1>

        @if($errors->any())
            @foreach($errors->all() as $error)
                <div class="alert alert-danger" role="alert">
                    {{ $error }}
                </div>
            @endforeach
        @endif

        <form method="POST" action="{{ route('schools.store') }}">
            @csrf

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}">
            </div>

            <button type="submit" class="btn btn-primary mt-3">Save School</button>
        </form>
    </div>
@endsection
