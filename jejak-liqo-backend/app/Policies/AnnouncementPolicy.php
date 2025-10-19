<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Announcement;

class AnnouncementPolicy
{
    public function delete(User $user, Announcement $announcement)
    {
        // contoh logika: hanya pembuat yang boleh hapus
        return $user->id === $announcement->created_by;
    }
}
