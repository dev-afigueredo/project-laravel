<?php

namespace App\Utilities;

use App\Models\Auth\User;
use App\Models\Common\Company;
use Composer\InstalledVersions;
use DB;

class Info
{
    public static function all()
    {
        return array_merge(static::versions(), [
            'api_key' => setting('apps.api_key'),
            'companies' => Company::count(),
            'users' => User::count(),
            'php_extensions' => static::phpExtensions(),
        ]);
    }

    public static function versions()
    {
        return [
            'ProjectLaravel' => version('short'),
            'laravel' => app()->version(),
            'php' => static::phpVersion(),
            'mysql' => static::mysqlVersion(),
            'livewire' => InstalledVersions::getPrettyVersion('livewire/livewire'),
        ];
    }

    public static function phpVersion()
    {
        return phpversion();
    }

    public static function phpExtensions()
    {
        return get_loaded_extensions();
    }

    public static function mysqlVersion()
    {
        static $version;

        if (empty($version) && (config('database.default') === 'mysql')) {
            $version = DB::selectOne('select version() as mversion')->mversion;
        }

        if (isset($version)) {
            return $version;
        }

        return 'N/A';
    }
}
