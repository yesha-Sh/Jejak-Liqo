<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\ApiResponse;
use App\Helpers\ActivityLogger;
use App\Http\Requests\StoreUserRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $request->validate([
            'role' => 'sometimes|in:super_admin,admin,mentor'
        ]);

        $users = User::query()
            ->when($request->role, fn($query, $role) => $query->where('role', $role))
            ->latest()
            ->paginate(15);

        return $this->success($users);
    }

    public function store(StoreUserRequest $request)
    {
        $data = $request->validated();
        $data['password'] = Hash::make($data['password']);

        $user = User::create($data);

        ActivityLogger::log('create', 'user', $user->id, "Created new user: {$user->full_name}");

        return $this->success($user, 'User created successfully.', 201);
    }

    public function show(User $user)
    {
        return $this->success($user);
    }

    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'full_name' => 'required|string|max:100',
            'email' => ['required', 'email', 'max:100', Rule::unique('users')->ignore($user->id)],
            'phone_number' => 'nullable|string|max:20',
            'role' => ['required', Rule::in(['admin', 'mentor'])],
            'status' => 'required|in:active,inactive',
            'password' => 'nullable|string|min:8|confirmed',
        ]);

        if (!empty($data['password'])) {
            $data['password'] = Hash::make($data['password']);
        } else {
            unset($data['password']);
        }

        $user->update($data);
        
        ActivityLogger::log('update', 'user', $user->id, "Updated user data: {$user->full_name}");

        return $this->success($user, 'User updated successfully.');
    }

    public function destroy(User $user)
    {
        if ($user->id === auth()->id()) {
            return $this->error('You cannot delete your own account.', 403);
        }
        
        $userName = $user->full_name;
        $userId = $user->id;
        $user->delete();

        ActivityLogger::log('delete', 'user', $userId, "Deleted user: {$userName}");

        return $this->success(null, 'User deleted successfully.');
    }
}