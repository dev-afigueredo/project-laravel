<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Invalid search string handling
    |--------------------------------------------------------------------------
    |
    | - all-results: (Default) Silently fail with a query containing everything.
    | - no-results: Silently fail with a query containing nothing.
    | - exceptions: Throw an `InvalidSearchStringException`.
    |
    */

    'fail' => 'all-results',

    /*
    |--------------------------------------------------------------------------
    | Default options
    |--------------------------------------------------------------------------
    |
    | When options are missing from your models, this array will be used
    | to fill the gaps. You can also define a set of options specific
    | to a model, using its class name as a key, e.g. 'App\User'.
    |
    */

    'default' => [
        'keywords' => [
            'order_by' => 'sort',
            'select' => 'fields',
            'limit' => 'limit',
            'offset' => 'page',
        ],
        'columns' => [
            'created_at' => 'date',
        ],
    ],

    App\Models\Auth\Permission::class => [
        'columns' => [
            'id',
            'name' => ['searchable' => true],
            'display_name' => ['searchable' => true],
            'description' => ['searchable' => true],
        ],
    ],

    App\Models\Auth\Role::class => [
        'columns' => [
            'id',
            'name' => ['searchable' => true],
            'display_name' => ['searchable' => true],
            'description' => ['searchable' => true],
        ],
    ],

    App\Models\Auth\User::class => [
        'columns' => [
            'id',
            'name' => ['searchable' => true],
            'email' => ['searchable' => true],
            'enabled' => ['boolean' => true],
            'last_logged_in_at' => ['date' => true],
        ],
    ],

    App\Models\Common\Company::class => [
        'columns' => [
            'id',
            'domain' => ['searchable' => true],
            'settings.value' => ['searchable' => true],
            'enabled' => ['boolean' => true],
        ],
    ],

    App\Models\Common\Dashboard::class => [
        'columns' => [
            'id',
            'name' => ['searchable' => true],
            'enabled' => ['boolean' => true],
        ],
    ],

    App\Models\Setting\Currency::class => [
        'columns' => [
            'id',
            'name' => ['searchable' => true],
            'code' => ['searchable' => true],
            'rate' => ['searchable' => true],
            'enabled' => ['boolean' => true],
            'precision',
            'symbol',
            'symbol_first' => [
                'boolean' => true,
                'translation' => [
                    0 => 'currencies.symbol.after',
                    1 => 'currencies.symbol.before',
                ]
            ],
            'decimal_mark',
            'thousands_separator',
        ],
    ],

    App\Models\Setting\Tax::class => [
        'columns' => [
            'id',
            'name' => ['searchable' => true],
            'type',
            'rate',
            'enabled' => ['boolean' => true],
        ],
    ],

    App\Models\Registers\Patient::class => [
        'columns' => [
            'id',
            'uuid',
            'name' => ['searchable' => true],
            'description_study' => ['searchable' => true],
            'sex' => [
                'values' => [
                    'M' => 'general.male',
                    'F' => 'general.female',
                    'N' => 'general.other',
                ]
            ],
            'birth_date' => ['date' => true],
        ],
    ],

];
