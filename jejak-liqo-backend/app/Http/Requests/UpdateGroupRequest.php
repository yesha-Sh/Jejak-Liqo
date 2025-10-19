<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateGroupRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Hanya admin yang bisa mengubah grup
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
}