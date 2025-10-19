<?php

namespace App\Http\Controllers;
use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreAnnouncementRequest;
use App\Models\Announcement;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class AnnouncementController extends Controller
{
    use ApiResponse, AuthorizesRequests;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $announcements = Announcement::with('creator:id,full_name')->latest()->get();
        return $this->success($announcements);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreAnnouncementRequest $request)
    {
        $validated = $request->validated();
        $validated['created_by'] = $request->user()->id;

        $announcement = Announcement::create($validated);
        ActivityLogger::log('create', 'announcement', $announcement->id, "Membuat pengumuman: {$announcement->title}");
        return $this->success($announcement, 'Pengumuman berhasil dibuat.', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Announcement $announcement)
    {
        return $this->success($announcement->load('creator:id,full_name'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Announcement $announcement)
    {
        $announcementTitle = $announcement->title;
        $announcementId = $announcement->id;

        $this->authorize('delete', $announcement); 

        $announcement->delete();
        ActivityLogger::log('delete', 'announcement', $announcementId, "Menghapus pengumuman: {$announcementTitle}");
        return $this->success(null, 'Pengumuman berhasil dihapus.');
    }
}