<?php

namespace App\Http\Controllers;

use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreBulkAttendanceRequest;
use App\Models\Attendance;
use App\Models\Meeting;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\DB;

class AttendanceController extends Controller
{
    use ApiResponse;

    /**
     * Store a newly created resource in storage.
     */
    public function storeBulk(StoreBulkAttendanceRequest $request)
    {
        $validated = $request->validated();
        $meetingId = $validated['meeting_id'];
        $attendancesData = $validated['attendances'];

        try {
            DB::beginTransaction();

            foreach ($attendancesData as $data) {
                Attendance::updateOrCreate(
                    [
                        'meeting_id' => $meetingId,
                        'mentee_id' => $data['mentee_id'],
                    ],
                    [
                        'status' => $data['status'],
                        'notes' => $data['notes'] ?? null,
                    ]
                );
            }

            DB::commit();

            $meeting = Meeting::find($meetingId);
            ActivityLogger::log('create', 'attendance', $meetingId, "Mengisi absensi untuk pertemuan: {$meeting->topic}");

            return $this->success(null, 'Absensi berhasil disimpan.');

        } catch (\Exception $e) {
            DB::rollBack();
            return $this->error('Gagal menyimpan absensi.', 500, $e->getMessage());
        }
    }
}