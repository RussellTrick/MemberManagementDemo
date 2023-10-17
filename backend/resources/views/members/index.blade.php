@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h1>Members</h1>

        @if($errors->any())
            @foreach($errors->all() as $error)
                <div class="alert alert-danger" role="alert">
                    {{ $error }}
                </div>
            @endforeach
        @endif

        <div class="row">
            <div class="col-md-12">
                <a href="{{ route('members.create') }}" class="btn btn-primary mb-3">Add New Member</a>
            </div>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @forelse($members as $member)
                    <tr>
                        <td class="min-width-185">{{ $member->name }}</td>
                        <td class="min-width-185">{{ $member->email }}</td>
                        <td class="min-width-185">
                            <a href="{{ route('members.show', $member->id) }}" class="btn btn-info">View</a>
                            <a href="{{ route('members.edit', $member->id) }}" class="btn btn-info">Edit</a>
                            <form action="{{ route('members.destroy', $member->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3">No members found.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
@endsection
