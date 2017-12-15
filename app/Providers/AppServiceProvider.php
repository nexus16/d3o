<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $repositories = [
            'UserRepositoryInterface' => 'UserRepository',
            'ProjectRepositoryInterface' => 'ProjectRepository',
            'CustomerRepositoryInterface' => 'CustomerRepository',
            'ProjectMemberRepositoryInterface' => 'ProjectMemberRepository',
            'TimesheetRepositoryInterface' => 'TimesheetRepository',
            'TaskRepositoryInterface' => 'TaskRepository',

        ];
        foreach ($repositories as $key => $val) {
            $this->app->bind("App\\Repositories\\Contracts\\$key", "App\\Repositories\\Eloquents\\$val");
        }
    }
}
