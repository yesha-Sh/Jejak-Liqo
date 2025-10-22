<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateAnnouncementRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Otorisasi akan ditangani oleh Policy (AnnouncementPolicy)
        // jadi kita bisa set ini ke true.
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            // 'sometimes' berarti hanya validasi jika field itu ada di request.
            // Ini penting untuk update, karena kita mungkin hanya ingin update judulnya saja,
            // atau kontennya saja.
            'title' => [
                'sometimes',
                'required',
                'string',
                'max:255'
            ],
            'content' => [
                'sometimes',
                'required',
                'string'
            ],
            'type' => [
                'sometimes',
                'required',
                'string',
                Rule::in(['info', 'warning', 'success', 'danger'])
            ],
        ];
    }
}