<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\SchoolController;

Route::get('/', [MemberController::class, 'index']);
Route::resource('members', MemberController::class);
Route::resource('schools', SchoolController::class);

