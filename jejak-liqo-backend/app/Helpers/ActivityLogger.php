<?php

namespace App\Helpers;

use App\Models\ActivityLog;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Auth;

class ActivityLogger
{
    /**
     * Log an activity.
     *
     * @param string $action
     * @param string $entity
     * @param int|null $entityId
     * @param string|null $description
     * @param array|null $meta
     */
    public static function log(string $action, string $entity, ?int $entityId = null, ?string $description = null, ?array $meta = null): void
    {
        if (!Auth::check()) {
            return;
        }

        ActivityLog::create([
            'user_id' => Auth::id(),
            'action' => $action,
            'entity' => $entity,
            'entity_id' => $entityId,
            'description' => $description,
            'ip_address' => Request::ip(),
            'user_agent' => Request::userAgent(),
            'meta' => $meta,
        ]);
    }
}