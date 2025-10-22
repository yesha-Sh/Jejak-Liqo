<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Announcement;
use Illuminate\Auth\Access\Response;

class AnnouncementPolicy
{
    public function update(User $user, Announcement $announcement): bool
    {
        // Hanya admin atau mentor yang bisa update
        return $user->hasRole('admin') || $user->hasRole('mentor');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Announcement $announcement): bool
    {
        // Hanya admin atau mentor yang bisa delete
        return $user->hasRole('admin') || $user->hasRole('mentor');
        
    }
   
}
