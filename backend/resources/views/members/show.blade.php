@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>Member Details</h1>

        @if($errors->any())
            @foreach($errors->all() as $error)
                <div class="alert alert-danger" role="alert">
                    {{ $error }}
                </div>
            @endforeach
        @endif

        <div class="card">
            <div class="card-body">
                <p><strong>Name:</strong> {{ $member->name }}</p>
                <p><strong>Email:</strong> {{ $member->email }}</p>
                <p><strong>School:</strong> {{ $member->school->name }}</p>
            </div>
        </div>

        <div class="mt-4">
            <a href="{{ url('/members/' . $member->id . '/edit') }}" class="btn btn-primary">Edit</a>
        

            <form action="{{ url('/members/' . $member->id) }}" method="post" class="d-inline">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>

        </div>
    </div>
@endsection
