<?php

/**
 * @package     ProjectLaravel
 * @copyright   2023 ProjectLaravel. All rights reserved.
 * @link        https://project-laravel.com.br
 */

// Register the auto-loader
require(__DIR__ . '/bootstrap/autoload.php');

// Load the app
$app = require_once(__DIR__ . '/bootstrap/app.php');

// Run the app
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);

$response = $kernel->handle(
    $request = Illuminate\Http\Request::capture()
);

$response->send();

$kernel->terminate($request, $response);
