<?php

namespace App\Listeners\Auth;

use App\Events\Auth\LandingPageShowing as Event;

class AddLandingPages
{
    /**
     * Handle the event.
     *
     * @param Event $event
     * @return void
     */
    public function handle(Event $event)
    {
        $user = user();
        $routes = [
            'dashboard' => [
                'permission' => 'read-common-dashboards',
                'translate'  => trans_choice('general.home', 1),
            ],
            'patients.index' => [
                'permission' => 'read-registers-patients',
                'translate'  => trans_choice('general.patients', 2),
            ],
            'settings.index' => [
                'permission' => 'read-settings-settings',
                'translate'  => trans_choice('general.settings', 2),
            ],
        ];

        foreach($routes as $key => $route) {
            if (!$user->can($route['permission'])) {
                continue;
            }

            $event->user->landing_pages[$key] = $route['translate'];
        }
    }
}
