<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/users', 'UserController@listUsers')->name('users');
Route::prefix('projects')->group(function () {
	Route::get('/', 'ProjectController@index')->name('projects');
	Route::get('/new', 'ProjectController@showFormCreate')->name('projects.create');
	Route::post('/', 'ProjectController@create')->name('projects.store');
	Route::get('/{id}', 'ProjectController@view')->name('projects.view');
	Route::get('/{id}/edit', 'ProjectController@showFormEdit')->name('projects.edit');
	Route::post('/{id}', 'ProjectController@update')->name('projects.update');
});
Route::prefix('timesheets')->group(function () {
	Route::get('/', 'TimesheetController@index')->name('timesheets');
	Route::get('/new', 'TimesheetController@showFormCreate')->name('timesheets.create');
	Route::post('/new', 'TimesheetController@create')->name('timesheets.store');


});
Route::resource('customers', 'CustomerController');
Route::get('/customers', 'CustomerController@listCustomers')->name('customers');
Route::get('404', function(){return view('404');});


