<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\v1\MemberApiController;
use App\Http\Controllers\api\v1\SchoolApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::prefix('v1')->group(function () {
    Route::apiResource('members', MemberApiController::class);
    Route::apiResource('schools', SchoolApiController::class);
    Route::get('/schools/{schoolId}/members', [SchoolApiController::class, 'getMembersBySchool']);
});