<?php

namespace App\Http\Controllers;

use App\Helpers\ActivityLogger;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\User;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    use ApiResponse;

    public function login(LoginRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['Credentials does not match.'],
            ]);
        }
        
        if ($user->status !== 'active') {
            return $this->error('Your account is inactive.', 403);
        }

        $token = $user->createToken('api-token')->plainTextToken;
        
        $user->update(['last_login_at' => now()]);

        ActivityLogger::log('login', 'auth', $user->id, 'User logged in successfully');

        return $this->success([
            'user' => $user,
            'token' => $token,
        ], 'Login successful.');
    }

    public function profile(Request $request)
    {
        return $this->success($request->user());
    }

    public function logout(Request $request)
    {
        $user = $request->user();
        $user->currentAccessToken()->delete();
        
        ActivityLogger::log('logout', 'auth', $user->id, 'User logged out successfully');

        return $this->success(null, 'Logout successful.');
    }
}