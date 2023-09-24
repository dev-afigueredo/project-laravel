<?php

use Illuminate\Support\Facades\Route;

/**
 * 'admin' middleware applied to all routes
 *
 * @see \App\Providers\Route::mapAdminRoutes
 * @see \modules\OfflinePayments\Routes\admin.php for module example
 */

Route::group(['as' => 'uploads.', 'prefix' => 'uploads'], function () {
    Route::delete('{id}', 'Common\Uploads@destroy')->name('destroy');
});

Route::group(['prefix' => 'common'], function () {
    Route::get('companies/autocomplete', 'Common\Companies@autocomplete')->name('companies.autocomplete');
    Route::get('companies/{company}/switch', 'Common\Companies@switch')->name('companies.switch');
    Route::get('companies/{company}/enable', 'Common\Companies@enable')->name('companies.enable');
    Route::get('companies/{company}/disable', 'Common\Companies@disable')->name('companies.disable');
    Route::resource('companies', 'Common\Companies', ['middleware' => ['dropzone']]);

    Route::get('dashboards/{dashboard}/switch', 'Common\Dashboards@switch')->name('dashboards.switch');
    Route::get('dashboards/{dashboard}/enable', 'Common\Dashboards@enable')->name('dashboards.enable');
    Route::get('dashboards/{dashboard}/disable', 'Common\Dashboards@disable')->name('dashboards.disable');
    Route::resource('dashboards', 'Common\Dashboards');

    Route::post('widgets/getData', 'Common\Widgets@getData')->name('widgets.getData');
    Route::resource('widgets', 'Common\Widgets');

    Route::get('import/{group}/{type}/{route?}', 'Common\Import@create')->name('import.create');

    Route::get('items/autocomplete', 'Common\Items@autocomplete')->name('items.autocomplete');
    Route::get('items/{item}/enable', 'Common\Items@enable')->name('items.enable');
    Route::get('items/{item}/disable', 'Common\Items@disable')->name('items.disable');
    Route::get('items/{item}/duplicate', 'Common\Items@duplicate')->name('items.duplicate');
    Route::post('items/import', 'Common\Items@import')->middleware('import')->name('items.import');
    Route::get('items/export', 'Common\Items@export')->name('items.export');
    Route::resource('items', 'Common\Items', ['middleware' => ['money', 'dropzone']]);

    Route::post('notifications/disable', 'Common\Notifications@disable')->name('notifications.disable');
    Route::get('notifications/readAll', 'Common\Notifications@readAll')->name('notifications.read-all');
    Route::resource('notifications', 'Common\Notifications');

    Route::post('bulk-actions/{group}/{type}', 'Common\BulkActions@action')->name('bulk-actions.action');

    Route::get('reports/{report}/print', 'Common\Reports@print')->name('reports.print');
    Route::get('reports/{report}/export', 'Common\Reports@export')->name('reports.export');
    Route::get('reports/{report}/duplicate', 'Common\Reports@duplicate')->name('reports.duplicate');
    Route::get('reports/{report}/clear', 'Common\Reports@clear')->name('reports.clear');
    Route::get('reports/fields', 'Common\Reports@fields')->name('reports.fields');
    Route::resource('reports', 'Common\Reports');
});

Route::group(['prefix' => 'auth'], function () {
    Route::get('logout', 'Auth\Login@destroy')->name('logout');

    Route::get('users/autocomplete', 'Auth\Users@autocomplete')->name('users.autocomplete');
    Route::get('users/{user}/read-bills', 'Auth\Users@readUpcomingBills')->name('users.read.bills');
    Route::get('users/{user}/read-invoices', 'Auth\Users@readOverdueInvoices')->name('users.read.invoices');
    Route::get('users/{user}/enable', 'Auth\Users@enable')->name('users.enable');
    Route::get('users/{user}/disable', 'Auth\Users@disable')->name('users.disable');
    Route::resource('users', 'Auth\Users', ['middleware' => ['dropzone']]);

    Route::resource('roles', 'Auth\Roles');

    Route::resource('permissions', 'Auth\Permissions');
});

Route::group(['prefix' => 'settings'], function () {
    Route::get('categories/{category}/enable', 'Settings\Categories@enable')->name('categories.enable');
    Route::get('categories/{category}/disable', 'Settings\Categories@disable')->name('categories.disable');
    Route::post('categories/import', 'Settings\Categories@import')->middleware('import')->name('categories.import');
    Route::get('categories/export', 'Settings\Categories@export')->name('categories.export');
    Route::resource('categories', 'Settings\Categories');

    Route::get('currencies/config', 'Settings\Currencies@config')->name('currencies.config');
    Route::get('currencies/{currency}/enable', 'Settings\Currencies@enable')->name('currencies.enable');
    Route::get('currencies/{currency}/disable', 'Settings\Currencies@disable')->name('currencies.disable');
    Route::resource('currencies', 'Settings\Currencies');

    Route::get('taxes/{tax}/enable', 'Settings\Taxes@enable')->name('taxes.enable');
    Route::get('taxes/{tax}/disable', 'Settings\Taxes@disable')->name('taxes.disable');
    Route::resource('taxes', 'Settings\Taxes');

    Route::group(['as' => 'settings.'], function () {
        Route::get('settings', 'Settings\Settings@index')->name('index');
        Route::patch('settings', 'Settings\Settings@update')->middleware('dropzone')->name('update');
        Route::get('company', 'Settings\Company@edit')->name('company.edit');
        Route::get('localisation', 'Settings\Localisation@edit')->name('localisation.edit');
        Route::get('invoice', 'Settings\Invoice@edit')->name('invoice.edit');
        Route::get('default', 'Settings\Defaults@edit')->name('default.edit');
        Route::get('email', 'Settings\Email@edit')->name('email.edit');
        Route::patch('email', 'Settings\Email@update')->name('email.update');
        Route::get('schedule', 'Settings\Schedule@edit')->name('schedule.edit');
    });
});

Route::group(['as' => 'settings.'], function () {
    Route::get('{alias}/settings', 'Settings\Modules@edit')->name('module.edit');
    Route::patch('{alias}/settings', 'Settings\Modules@update')->middleware('dropzone')->name('module.update');
});

Route::group(['as' => 'apps.', 'prefix' => 'apps'], function () {
    Route::resource('api-key', 'Modules\ApiKey');

    Route::group(['middleware' => 'api.key'], function () {
        Route::resource('home', 'Modules\Home');

        Route::resource('my', 'Modules\My');

        Route::get('categories/{alias}', 'Modules\Tiles@categoryModules')->name('categories.show');
        Route::get('vendors/{alias}', 'Modules\Tiles@vendorModules')->name('vendors.show');
        Route::get('docs/{alias}', 'Modules\Item@documentation')->name('docs.show');

        Route::get('paid', 'Modules\Tiles@paidModules')->name('paid');
        Route::get('new', 'Modules\Tiles@newModules')->name('new');
        Route::get('free', 'Modules\Tiles@freeModules')->name('free');
        Route::get('search', 'Modules\Tiles@searchModules')->name('search');
        Route::post('steps', 'Modules\Item@steps')->name('steps');
        Route::post('download', 'Modules\Item@download')->name('download');
        Route::post('unzip', 'Modules\Item@unzip')->name('unzip');
        Route::post('copy', 'Modules\Item@copy')->name('copy');
        Route::post('install', 'Modules\Item@install')->name('install');

        Route::post('{alias}/releases', 'Modules\Item@releases')->name('app.releases');
        Route::post('{alias}/reviews', 'Modules\Item@reviews')->name('app.reviews');
        Route::get('{alias}/uninstall', 'Modules\Item@uninstall')->name('app.uninstall');
        Route::get('{alias}/enable', 'Modules\Item@enable')->name('app.enable');
        Route::get('{alias}/disable', 'Modules\Item@disable')->name('app.disable');
        Route::get('{alias}', 'Modules\Item@show')->name('app.show');
    });
});

Route::group(['prefix' => 'install'], function () {
    Route::get('updates', 'Install\Updates@index')->name('updates.index');
    Route::get('updates/changelog', 'Install\Updates@changelog')->name('updates.changelog');
    Route::get('updates/check', 'Install\Updates@check')->name('updates.check');
    Route::get('updates/run/{alias}/{version}', 'Install\Updates@run')->name('updates.run');
    Route::post('updates/steps', 'Install\Updates@steps')->name('updates.steps');
    Route::post('updates/download', 'Install\Updates@download')->middleware('api.key')->name('updates.download');
    Route::post('updates/unzip', 'Install\Updates@unzip')->middleware('api.key')->name('updates.unzip');
    Route::post('updates/copy-files', 'Install\Updates@copyFiles')->middleware('api.key')->name('updates.copy');
    Route::post('updates/migrate', 'Install\Updates@migrate')->name('updates.migrate');
    Route::post('updates/finish', 'Install\Updates@finish')->name('updates.finish');
    Route::post('updates/redirect', 'Install\Updates@redirect')->name('updates.redirect');
});

Route::group(['as' => 'modals.', 'prefix' => 'modals'], function () {
    Route::resource('accounts', 'Modals\Accounts');
    Route::resource('categories', 'Modals\Categories');
    Route::resource('currencies', 'Modals\Currencies');
    Route::resource('customers', 'Modals\Customers');
    Route::resource('companies', 'Modals\Companies');
    Route::resource('vendors', 'Modals\Vendors');
    Route::resource('items', 'Modals\Items');
    Route::patch('invoice-templates', 'Modals\InvoiceTemplates@update')->name('invoice-templates.update');
    Route::patch('transfer-templates', 'Modals\TransferTemplates@update')->name('transfer-templates.update');
    Route::get('documents/item-columns/edit', 'Modals\DocumentItemColumns@edit')->name('documents.item-columns.edit');
    Route::patch('documents/item-columns', 'Modals\DocumentItemColumns@update')->name('documents.item-columns.update');
    Route::resource('documents/{document}/transactions', 'Modals\DocumentTransactions', [
        'names' => 'documents.document.transactions',
        'middleware' => ['date.format', 'money', 'dropzone']
    ]);
    Route::resource('taxes', 'Modals\Taxes');
});
