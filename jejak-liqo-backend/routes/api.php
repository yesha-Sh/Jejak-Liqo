<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\MenteeController;
use App\Http\Controllers\MeetingController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\AnnouncementController;
use App\Http\Controllers\ReportController;

// Public routes
Route::post('/login', [AuthController::class, 'login'])->middleware('throttle:5,1');

// Authenticated routes
Route::middleware('auth:sanctum')->group(function () {
    // Auth
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/profile', [AuthController::class, 'profile']);

    // Super Admin & Admin Routes
    Route::middleware('role:super_admin,admin')->group(function () {
        Route::apiResource('users', UserController::class);
        Route::apiResource('groups', GroupController::class);
        Route::apiResource('mentees', MenteeController::class);
        Route::apiResource('meetings', MeetingController::class);
        Route::apiResource('announcements', AnnouncementController::class);
    });
    
    // Mentor Routes
    Route::middleware('role:mentor')->group(function () {
        Route::get('/my-groups', [GroupController::class, 'myGroups']);
        Route::get('/my-meetings', [MeetingController::class, 'myMeetings']);
    });
    
    // Shared routes for Admin & Mentor
    Route::middleware('role:admin,mentor')->group(function(){
        Route::post('/attendances/bulk', [AttendanceController::class, 'storeBulk']);
        
    });
  
Route::middleware('auth:sanctum')->group(function () {
    // Download report langsung
    Route::get('/reports/download', [ReportController::class, 'download']);
    Route::get('/profile', [AuthController::class, 'profile']);
    Route::post('/profile', [AuthController::class, 'updateProfile']);
    // Get groups & mentors untuk filter
    Route::get('/groups', [GroupController::class, 'index']);
    Route::get('/users', [UserController::class, 'index']);
});
});