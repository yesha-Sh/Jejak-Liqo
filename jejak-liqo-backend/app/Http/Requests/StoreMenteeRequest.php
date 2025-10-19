<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreMenteeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return $this->user()->role === 'admin' || $this->user()->role === 'super_admin';
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