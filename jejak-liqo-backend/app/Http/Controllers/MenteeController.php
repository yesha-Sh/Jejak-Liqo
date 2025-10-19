<?php

namespace App\Http\Controllers;

use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreMenteeRequest;
use App\Http\Requests\UpdateMenteeRequest;
use App\Models\Mentee;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class MenteeController extends Controller
{
    use ApiResponse;

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Mentee::with('group:id,group_name');

        if ($request->user()->role === 'mentor') {
            $groupIds = $request->user()->groups()->pluck('id');
            $query->whereIn('group_id', $groupIds);
        }

        $mentees = $query->latest()->paginate(20);
        return $this->success($mentees);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreMenteeRequest $request)
    {
        $mentee = Mentee::create($request->validated());
        ActivityLogger::log('create', 'mentee', $mentee->id, "Mendaftarkan mentee baru: {$mentee->full_name}");
        return $this->success($mentee, 'Mentee berhasil didaftarkan.', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Mentee $mentee)
    {
        $mentee->load('group');
        return $this->success($mentee);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMenteeRequest $request, Mentee $mentee)
    {
        $mentee->update($request->validated());
        ActivityLogger::log('update', 'mentee', $mentee->id, "Memperbarui data mentee: {$mentee->full_name}");
        return $this->success($mentee, 'Data mentee berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Mentee $mentee)
    {
        $menteeName = $mentee->full_name;
        $menteeId = $mentee->id;
        $mentee->delete();
        ActivityLogger::log('delete', 'mentee', $menteeId, "Menghapus mentee: {$menteeName}");
        return $this->success(null, 'Mentee berhasil dihapus.');
    }
}