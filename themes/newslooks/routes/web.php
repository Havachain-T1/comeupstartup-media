<?php

use Illuminate\Support\Facades\Route;
use Theme\NewsLooks\Http\Controllers\User\UserController;
use Theme\NewsLooks\Http\Controllers\Backend\ReportController;
use Theme\NewsLooks\Http\Controllers\Backend\VotingController;
use Theme\NewsLooks\Http\Controllers\Backend\WidgetController;
use Theme\NewsLooks\Http\Controllers\Frontend\FrontendController;
use Theme\NewsLooks\Http\Controllers\Backend\ManageUserController;
use Theme\NewsLooks\Http\Controllers\Backend\ThemeOptionController;
use Theme\NewsLooks\Http\Controllers\Frontend\NewsletterController;
use Theme\NewsLooks\Http\Controllers\Frontend\FrontendBlogController;

Route::middleware('tract.visitor')->group(function () {
    Route::get('/', [FrontendController::class, 'index'])->name('home');

    Route::get('/posts', [FrontendBlogController::class, 'blogs'])->name('theme.newslooks.blog.list');
    Route::get('/post/{permalink}', [FrontendBlogController::class, 'details'])->name('theme.newslooks.blog.details');

    // Blog Filter By Routes
    Route::get('/category/{permalink}', [FrontendBlogController::class, 'blogByCategory'])->name('theme.newslooks.blog.blogByCategory');
    Route::get('/tag/{permalink}', [FrontendBlogController::class, 'blogByTag'])->name('theme.newslooks.blog.blogByTag');
    Route::get('/search/{text}', [FrontendBlogController::class, 'blogBySearch'])->name('theme.newslooks.blog.blogBySearch');
    Route::get('/author/{name}', [FrontendBlogController::class, 'blogByAuthor'])->name('theme.newslooks.blog.blogByAuthor');
    Route::get('/date/{date}', [FrontendBlogController::class, 'blogByDate'])->where('date', '.+')->name('theme.newslooks.blog.blogByDate');
    Route::get('/filter/{filter}', [FrontendBlogController::class, 'blogByFilter'])->name('theme.newslooks.blog.blogByFilter');
});

// Newsletter Subscribe
Route::post('/newsletter/store', [NewsletterController::class, 'store'])->name('theme.newslooks.newsletter.store');


// Contact Form
Route::post('/contact/submit', [FrontendController::class, 'sendMessage'])->name('theme.newslooks.contact.submit');

// Blog Details Page
Route::post('/post/password/load', [FrontendBlogController::class, 'getBlogContent'])->name('theme.newslooks.blog.password.load');
Route::post('/post/comment', [FrontendBlogController::class, 'loadBlogComment'])->name('theme.newslooks.blog.comment.load');
Route::post('/post/comment/create', [FrontendBlogController::class, 'createBlogComment'])->name('theme.newslooks.blog.comment.create');

// Give Vote
Route::post('/poll-vote', [FrontendController::class, 'vote'])->name('theme.newslooks.vote.give');

// Language change
Route::post('/language-change', [FrontendController::class, 'changeLanguage'])->name('theme.newslooks.language.change');

//Backend
Route::group(['middleware' => ['auth', 'admin.guard'], 'prefix' => getAdminPrefix()], function () {
    // Frontend Visitor
    Route::post('website-visitor-reports', [ReportController::class, 'visitorReports'])->name('theme.newslooks.visitor.reports');
    Route::post('country-reports', [ReportController::class, 'countryReports'])->name('theme.newslooks.country.reports');
    Route::post('browser-reports', [ReportController::class, 'browserReports'])->name('theme.newslooks.browser.reports');
    Route::post('device-reports', [ReportController::class, 'deviceReports'])->name('theme.newslooks.device.reports');

    Route::middleware(['can:Manage Widget'])->group(function () {
        // Widgets Controller
        Route::get('/manage-widgets', [WidgetController::class, 'widgets'])->name('theme.newslooks.widgets');
        Route::post('/get-widget-input', [WidgetController::class, 'getWidgetInputFields'])->name('theme.newslooks.widget.get_input_field');
        Route::post('/add-widget-sidebar', [WidgetController::class, 'addWidgetToSidebar'])->name('theme.newslooks.widget.addToSidebar');
        Route::post('/remove-widget-sidebar', [WidgetController::class, 'removeWidgetFromSidebar'])->name('theme.newslooks.widget.removeFromSidebar')->middleware('demo');
        Route::post('/save-sidebar-widget-form', [WidgetController::class, 'saveWidgetSidebarInput'])->name('theme.newslooks.widget.widgetSidebarForm');
        Route::post('/widget-order-save', [WidgetController::class, 'saveWidgetOrder'])->name('theme.newslooks.widget.saveWidgetOrder');
    });

    Route::middleware(['can:Manage Theme General settings'])->group(function () {
        //Theme Options
        Route::get('/theme-options', [ThemeOptionController::class, 'themeOptions'])->name('theme.newslooks.options');
        Route::post('/get-theme-option-form', [ThemeOptionController::class, 'getOptionForm'])->name('theme.newslooks.get.option.form');
        Route::post('/save-theme-option-form', [ThemeOptionController::class, 'saveOptionForm'])->name('theme.newslooks.save.option.form')->middleware('demo');
        Route::post('/import-theme-option', [ThemeOptionController::class, 'importThemeOption'])->name('theme.newslooks.theme-option.import');
        Route::get('/theme-option/download', [ThemeOptionController::class, 'downloadThemeOption'])->name('theme.newslooks.theme-option.download');
    });

    Route::middleware(['can:Manage Voting'])->group(function () {
        //Vote Options
        Route::get('/votes', [VotingController::class, 'index'])->name('theme.newslooks.vote.index');
        Route::get('/vote/create', [VotingController::class, 'create'])->name('theme.newslooks.vote.create');
        Route::post('/vote/store', [VotingController::class, 'store'])->name('theme.newslooks.vote.store');
        Route::get('/vote/edit/{vote}', [VotingController::class, 'edit'])->name('theme.newslooks.vote.edit');
        Route::put('/vote/update/{vote}', [VotingController::class, 'update'])->name('theme.newslooks.vote.update')->middleware('demo');
        Route::delete('/vote/delete/{vote}', [VotingController::class, 'delete'])->name('theme.newslooks.vote.delete')->middleware('demo');
    });

    Route::middleware(['can:Manage Members' ])->group(function () {
        //Vote Options
        Route::get('/manage-users', [ManageUserController::class, 'allUsers'])->name('theme.newslooks.users');
        Route::post('/users/status', [ManageUserController::class, 'statusUpdate'])->name('theme.newslooks.users.status')->middleware('demo');
        Route::delete('/users/delete', [ManageUserController::class, 'deleteUser'])->name('theme.newslooks.users.delete')->middleware('demo');
    });
    
});

// User Routes
Route::group(['prefix' => 'user'], function () {

    Route::get('/login', [UserController::class, 'login'])->name('theme.newslooks.user.login');
    Route::post('/login-submit', [UserController::class, 'attemptLogin'])->name('theme.newslooks.user.attemptLogin');
    Route::get('/registration', [UserController::class, 'registration'])->name('theme.newslooks.user.registration');
    Route::post('/registration-submit', [UserController::class, 'registrationSubmit'])->name('theme.newslooks.user.registrationSubmit');

    Route::group(['middleware' => ['auth', 'user.guard']], function () {
        Route::get('/dashboard', [UserController::class, 'dashboard'])->name('theme.newslooks.user.dashboard');
        Route::get('/comments', [UserController::class, 'comments'])->name('theme.newslooks.user.comments');

        Route::get('/profile', [UserController::class, 'profile'])->name('theme.newslooks.user.profile');
        Route::post('/update-profile/{user}', [UserController::class, 'updateProfile'])->name('theme.newslooks.user.update.profile');
        Route::post('/update-password/{user}', [UserController::class, 'updatePassword'])->name('theme.newslooks.user.update.password');

        Route::delete('/readingList/remove', [UserController::class, 'removeFromReadingList'])->name('theme.newslooks.user.remove.readingList');

        Route::get('/logout', [UserController::class, 'logout'])->name('theme.newslooks.user.logout');
    });

    Route::post('/readingList/update', [UserController::class, 'updateReadingList'])->name('theme.newslooks.user.update.readingList');

});

// Page Routes
Route::get('/page/{permalink?}', [FrontendController::class, 'pageDetails'])->name('theme.newslooks.viewPage')->where('permalink', '.+')->middleware('tract.visitor');
Route::post('/page/password/load', [FrontendController::class, 'getPageContent'])->name('theme.newslooks.page.password.load');
