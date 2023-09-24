<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CoreV1 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Categories
        Schema::create('categories', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('name');
            $table->string('type');
            $table->string('color');
            $table->boolean('enabled')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
        });

        // Companies
        Schema::create('companies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('domain');
            $table->boolean('enabled')->default(1);
            $table->timestamps();
            $table->softDeletes();
        });

        // Currencies
        Schema::create('currencies', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('name');
            $table->string('code');
            $table->double('rate', 15, 8);
            $table->string('precision')->nullable();
            $table->string('symbol')->nullable();
            $table->integer('symbol_first')->default(1);
            $table->string('decimal_mark')->nullable();
            $table->string('thousands_separator')->nullable();
            $table->tinyInteger('enabled')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
            $table->unique(['company_id', 'code', 'deleted_at']);
        });

        // Jobs
        Schema::create('jobs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('queue');
            $table->longText('payload');
            $table->tinyInteger('attempts')->unsigned();
            $table->unsignedInteger('reserved_at')->nullable();
            $table->unsignedInteger('available_at');
            $table->unsignedInteger('created_at');

            $table->index(['queue', 'reserved_at']);
        });

        Schema::create('failed_jobs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('connection');
            $table->text('queue');
            $table->longText('payload');
            $table->longText('exception');
            $table->timestamp('failed_at')->useCurrent();
        });

        // Media
        Schema::table('media', function (Blueprint $table) {
            $table->softDeletes();

            $table->index(['disk', 'directory']);
            $table->unique(['disk', 'directory', 'filename', 'extension', 'deleted_at']);
        });

        // Modules
        Schema::create('modules', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('alias');
            $table->integer('status');
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
            $table->unique(['company_id', 'alias', 'deleted_at']);
        });

        Schema::create('module_histories', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->integer('module_id');
            $table->string('category');
            $table->string('version');
            $table->text('description')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->index(['company_id', 'module_id']);
        });

        // Notifications
        Schema::create('notifications', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('type');
            $table->morphs('notifiable');
            $table->text('data');
            $table->timestamp('read_at')->nullable();
            $table->timestamps();
        });

        // Password resets
        Schema::create('password_resets', function (Blueprint $table) {
            $table->string('email');
            $table->string('token');
            $table->timestamp('created_at')->nullable();

            $table->index('email');
        });

        // Permissions
        Schema::create('permissions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('display_name');
            $table->string('description')->nullable();
            $table->timestamps();

            $table->unique('name');
        });

        Schema::create('roles', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('display_name');
            $table->string('description')->nullable();
            $table->timestamps();

            $table->unique('name');
        });

        Schema::create('role_permissions', function (Blueprint $table) {
            $table->integer('role_id')->unsigned();
            $table->integer('permission_id')->unsigned();

            $table->foreign('role_id')->references('id')->on('roles')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('permission_id')->references('id')->on('permissions')
                ->onUpdate('cascade')->onDelete('cascade');

            $table->primary(['role_id', 'permission_id']);
        });

        Schema::create('user_permissions', function (Blueprint $table) {
            $table->integer('user_id')->unsigned();
            $table->integer('permission_id')->unsigned();
            $table->string('user_type');

            $table->foreign('permission_id')->references('id')->on('permissions')
                ->onUpdate('cascade')->onDelete('cascade');

            $table->primary(['user_id', 'permission_id', 'user_type']);
        });

        Schema::create('user_roles', function (Blueprint $table) {
            $table->integer('user_id')->unsigned();
            $table->integer('role_id')->unsigned();
            $table->string('user_type');

            $table->foreign('role_id')->references('id')->on('roles')
                ->onUpdate('cascade')->onDelete('cascade');

            $table->primary(['user_id', 'role_id', 'user_type']);
        });

        // Sessions
        Schema::create('sessions', function (Blueprint $table) {
            $table->string('id')->unique();
            $table->unsignedInteger('user_id')->nullable();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->text('payload');
            $table->integer('last_activity');
        });

        // Settings
        Schema::create('settings', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('key');
            $table->text('value')->nullable();

            $table->index('company_id');
            $table->unique(['company_id', 'key']);
        });

        // Taxes
        Schema::create('taxes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('name');
            $table->double('rate', 15, 4);
            $table->string('type')->default('normal');
            $table->boolean('enabled')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
        });

        // Transfers
        Schema::create('transfers', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->integer('payment_id');
            $table->integer('revenue_id');
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
        });

        // Users
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email');
            $table->string('password');
            $table->rememberToken();
            $table->timestamp('last_logged_in_at')->nullable();
            $table->string('locale')->default(config('app.locale'));
            $table->boolean('enabled')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->unique(['email', 'deleted_at']);
        });

        Schema::create('user_companies', function (Blueprint $table) {
            $table->integer('user_id')->unsigned();
            $table->integer('company_id')->unsigned();
            $table->string('user_type');

            $table->primary(['user_id', 'company_id', 'user_type']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('categories');
        Schema::drop('companies');
        Schema::drop('currencies');
        Schema::drop('jobs');
        Schema::drop('failed_jobs');
        Schema::drop('mediables');
        Schema::drop('media');
        Schema::drop('modules');
        Schema::drop('module_histories');
        Schema::drop('notifications');
        Schema::drop('password_resets');

        // Cascade table first
        Schema::drop('user_permissions');
        Schema::drop('role_permissions');
        Schema::drop('permissions');
        Schema::drop('user_roles');
        Schema::drop('roles');

        Schema::drop('sessions');
        Schema::drop('settings');
        Schema::drop('taxes');
        Schema::drop('users');
        Schema::drop('user_companies');
    }
}
