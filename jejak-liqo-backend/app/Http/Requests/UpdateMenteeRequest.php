<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateMenteeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Di masa depan, bisa ditambahkan logic agar mentor hanya bisa edit mentee di grupnya
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
            'full_name' => 'required|string|max:100',
            'nickname' => 'nullable|string|max:50',
            'birth_date' => 'nullable|date',
            'phone_number' => 'nullable|string|max:20',
            'address' => 'nullable|string',
            'status' => ['required', Rule::in(['Aktif', 'Lulus', 'Nonaktif'])],
        ];
    }
}