<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CoreV2117 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('categories', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('enabled');
        });

        Schema::table('companies', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('enabled');
        });

        Schema::table('currencies', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('enabled');
        });

        Schema::table('dashboards', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('enabled');
        });

        Schema::table('documents', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('parent_id');
        });

        Schema::table('items', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('enabled');
        });

        Schema::table('reports', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('settings');
        });

        Schema::table('taxes', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('enabled');
        });

        Schema::table('widgets', function (Blueprint $table) {
            $table->unsignedInteger('created_by')->nullable()->after('settings');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
