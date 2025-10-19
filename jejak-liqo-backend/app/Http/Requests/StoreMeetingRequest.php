<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreMeetingRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
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
            'group_id' => 'required|integer|exists:groups,id',
            'topic' => 'required|string|max:150',
            'meeting_date' => 'required|date',
            'place' => 'required|string|max:150',
            'notes' => 'nullable|string',
            'meeting_type' => ['required', Rule::in(['Online', 'Offline'])],
        ];
    }
}