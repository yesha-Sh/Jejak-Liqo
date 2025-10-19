<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreGroupRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Hanya admin yang bisa membuat grup
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
            'group_name' => 'required|string|max:100',
            'description' => 'nullable|string',
            'mentor_id' => 'required|integer|exists:users,id,role,mentor',
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'mentor_id.exists' => 'Mentor yang dipilih tidak valid atau bukan merupakan seorang mentor.',
        ];
    }
}