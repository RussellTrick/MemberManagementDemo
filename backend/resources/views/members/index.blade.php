@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>Members</h1>

        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($members as $member)
                            <tr>
                                <td>{{ $member->name }}</td>
                                <td>{{ $member->email }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="2">No members found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <a href="{{ route('members.create') }}" class="btn btn-primary">Add New Member</a>
            </div>
        </div>
    </div>
@endsection