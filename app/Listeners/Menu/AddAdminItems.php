<?php

namespace App\Listeners\Menu;

use App\Events\Menu\AdminCreated as Event;
use App\Traits\Permissions;

class AddAdminItems
{
    use Permissions;

    /**
     * Handle the event.
     *
     * @param  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $menu = $event->menu;

        // Home
        $title = trim(trans_choice('general.home', 1));
        $menu->add([
            'url' => '/' . company_id(),
            'title' => $title,
            'icon' => 'fa fa-home',
        ]);

        // Settings
        $title = trim(trans_choice('general.settings', 2));
        if ($this->canAccessMenuItem($title, 'read-settings-settings')) {
            $menu->route('settings.index', $title, [], 70, ['icon' => 'fa fa-cog']);
        }
    }
}
