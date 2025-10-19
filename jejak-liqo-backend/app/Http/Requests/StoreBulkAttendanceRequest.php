<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreBulkAttendanceRequest extends FormRequest
{
    /**
     *     public aic function authorize(): bool
    {
        return in_array($this->user()->role, ['admin', 'super_admin', 'mentor']);
    }
     */
    public function authorize(): bool
    {
        return in_array($this->user()->role, ['admin', 'super_admin', 'mentor']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'meeting_id' => 'required|integer|exists:meetings,id',
            'attendances' => 'required|array',
            'attendances.*.mentee_id' => 'required|integer|exists:mentees,id',
            'attendances.*.status' => ['required', Rule::in(['Hadir', 'Izin', 'Sakit', 'Alfa'])],
            'attendances.*.notes' => 'nullable|string',
        ];
    }
}