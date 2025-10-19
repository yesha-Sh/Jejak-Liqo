<?php

namespace App\Http\Controllers;

use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreMeetingRequest;
use App\Http\Requests\UpdateMeetingRequest;
use App\Models\Meeting;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class MeetingController extends Controller
{
    use ApiResponse;

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Meeting::with('group:id,group_name');

        if ($request->user()->role === 'mentor') {
            $query->where('mentor_id', $request->user()->id);
        }

        $meetings = $query->latest('meeting_date')->paginate(20);
        return $this->success($meetings);
    }
    
    /**
     * Display a listing of the meetings for the authenticated mentor.
     */
    public function myMeetings(Request $request)
    {
         $meetings = Meeting::where('mentor_id', $request->user()->id)
            ->with('group:id,group_name')
            ->latest('meeting_date')
            ->get();
        return $this->success($meetings);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreMeetingRequest $request)
    {
        $validated = $request->validated();
        $validated['mentor_id'] = $request->user()->id; // Otomatis set mentor_id

        $meeting = Meeting::create($validated);
        ActivityLogger::log('create', 'meeting', $meeting->id, "Membuat pertemuan baru: {$meeting->topic}");
        return $this->success($meeting, 'Pertemuan berhasil dibuat.', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Meeting $meeting)
    {
        $meeting->load('group.mentees', 'attendances');
        return $this->success($meeting);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMeetingRequest $request, Meeting $meeting)
    {
        $meeting->update($request->validated());
        ActivityLogger::log('update', 'meeting', $meeting->id, "Memperbarui pertemuan: {$meeting->topic}");
        return $this->success($meeting, 'Pertemuan berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Meeting $meeting)
    {
        $meetingTopic = $meeting->topic;
        $meetingId = $meeting->id;
        $meeting->delete();
        ActivityLogger::log('delete', 'meeting', $meetingId, "Menghapus pertemuan: {$meetingTopic}");
        return $this->success(null, 'Pertemuan berhasil dihapus.');
    }
}