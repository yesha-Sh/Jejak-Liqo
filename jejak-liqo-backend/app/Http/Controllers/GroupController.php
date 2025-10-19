<?php

namespace App\Http\Controllers;

use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreGroupRequest;
use App\Http\Requests\UpdateGroupRequest;
use App\Models\Group;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class GroupController extends Controller
{
    use ApiResponse;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $groups = Group::with('mentor:id,full_name')->withCount('mentees')->latest()->get();
        return $this->success($groups);
    }
    
    /**
     * Display a listing of the groups for the authenticated mentor.
     */
    public function myGroups(Request $request)
    {
        $groups = Group::where('mentor_id', $request->user()->id)
            ->with('mentor:id,full_name')
            ->withCount('mentees')
            ->latest()
            ->get();
        return $this->success($groups);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreGroupRequest $request)
    {
        $group = Group::create($request->validated());
        ActivityLogger::log('create', 'group', $group->id, "Membuat grup baru: {$group->group_name}");
        return $this->success($group, 'Grup berhasil dibuat.', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Group $group)
    {
        $group->load('mentor:id,full_name', 'mentees');
        return $this->success($group);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateGroupRequest $request, Group $group)
    {
        $group->update($request->validated());
        ActivityLogger::log('update', 'group', $group->id, "Memperbarui grup: {$group->group_name}");
        return $this->success($group, 'Grup berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Group $group)
    {
        $groupName = $group->group_name;
        $groupId = $group->id;
        $group->delete();
        ActivityLogger::log('delete', 'group', $groupId, "Menghapus grup: {$groupName}");
        return $this->success(null, 'Grup berhasil dihapus.');
    }
}