<?php

namespace App\Http\Controllers;
use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreAnnouncementRequest;
use App\Models\Announcement;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Requests\UpdateAnnouncementRequest;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Resources\AnnouncementResource;

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
   /**
     * Remove the specified resource from storage.
     */
    public function destroy(Announcement $announcement)
    {
        $announcementTitle = $announcement->title;
        $announcementId = $announcement->id;

        // [PERBAIKAN] Ganti kode $this->authorize dengan pengecekan role manual
        $user = auth()->user();
        if ($user->role !== 'admin' && $user->role !== 'super_admin') {
             return $this->error('Anda tidak memiliki izin untuk menghapus pengumuman.', 403);
        }
        // [AKHIR PERBAIKAN]

        $announcement->delete();
        ActivityLogger::log('delete', 'announcement', $announcementId, "Menghapus pengumuman: {$announcementTitle}");
        return $this->success(null, 'Pengumuman berhasil dihapus.');
    }
    public function update(UpdateAnnouncementRequest $request, Announcement $announcement)
{
    // Otorisasi user menggunakan policy
    $this->authorize('update', $announcement);

    try {
        // Validasi sudah dilakukan oleh UpdateAnnouncementRequest
        $validated = $request->validated();

        $announcement->update($validated);

        // Log aktivitas
        ActivityLogger::log('Updated announcement: ' . $announcement->title, $request->user()->id);

        return $this->sendResponse(
            new AnnouncementResource($announcement),
            'Announcement updated successfully.'
        );
    } catch (\Exception $e) {
        return $this->sendError('Update Failed', ['error' => $e->getMessage()], 500);
    }
}
}