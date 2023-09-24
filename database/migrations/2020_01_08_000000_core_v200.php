<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CoreV200 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Dashboards
        Schema::create('dashboards', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('name');
            $table->boolean('enabled')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->index(['company_id']);
        });

        Schema::create('user_dashboards', function (Blueprint $table) {
            $table->integer('user_id')->unsigned();
            $table->integer('dashboard_id')->unsigned();
            $table->string('user_type', 20);

            $table->primary(['user_id', 'dashboard_id', 'user_type']);
        });

        Schema::create('widgets', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->integer('dashboard_id');
            $table->string('class');
            $table->string('name');
            $table->integer('sort')->default(0);
            $table->text('settings')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->index(['company_id', 'dashboard_id']);
        });

        // Email templates
        Schema::create('email_templates', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('alias');
            $table->string('class');
            $table->string('name');
            $table->string('subject');
            $table->text('body');
            $table->text('params')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
            $table->unique(['company_id', 'alias', 'deleted_at']);
        });

        // Firewall
        Schema::create('firewall_ips', function (Blueprint $table) {
            $table->increments('id');
            $table->string('ip');
            $table->integer('log_id')->nullable();
            $table->boolean('blocked')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->index('ip');
            $table->unique(['ip', 'deleted_at']);
        });

        Schema::create('firewall_logs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('ip');
            $table->string('level')->default('medium');
            $table->string('middleware');
            $table->integer('user_id')->nullable();
            $table->string('url')->nullable();
            $table->string('referrer')->nullable();
            $table->text('request')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->index('ip');
        });

        // Reports
        Schema::create('reports', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('class');
            $table->string('name');
            $table->text('description');
            $table->text('settings')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
        });

        // Domain column
        Schema::table('companies', function (Blueprint $table) {
            $table->string('domain')->nullable()->change();
        });

        // Status column
        Schema::table('modules', function (Blueprint $table) {
            $table->renameColumn('status', 'enabled');
        });

        // Sku and quantity columns
        Schema::table('items', function (Blueprint $table) {
            $table->string('sku')->nullable()->change();
            $table->integer('quantity')->default(1)->change();

            $connection = Schema::getConnection();
            $d_table = $connection->getDoctrineSchemaManager()->listTableDetails($connection->getTablePrefix() . 'items');

            if ($d_table->hasIndex('items_company_id_sku_deleted_at_unique')) {
                // 1.3 update
                $table->dropUnique('items_company_id_sku_deleted_at_unique');
            } else {
                // 2.0 install
                $table->dropUnique(['company_id', 'sku', 'deleted_at']);
            }
        });

        // Landing page column
        Schema::table('users', function (Blueprint $table) {
            $table->string('landing_page', 70)->nullable()->default('dashboard')->after('locale');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('dashboards');
        Schema::drop('user_dashboards');
        Schema::drop('widgets');
        Schema::drop('email_templates');
        Schema::drop('firewall_ips');
        Schema::drop('firewall_logs');
        Schema::drop('reports');

        Schema::table('companies', function (Blueprint $table) {
            $table->string('domain')->change();
        });

        Schema::table('modules', function (Blueprint $table) {
            $table->renameColumn('enabled', 'status');
        });

        Schema::table('items', function (Blueprint $table) {
            $table->string('sku')->change();
            $table->integer('quantity')->change();
            $table->unique(['company_id', 'sku', 'deleted_at']);
        });
    }
}
