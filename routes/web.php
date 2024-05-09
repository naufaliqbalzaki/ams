<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\InstanceController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


Route::redirect('/', '/dashboard');


Route::middleware('auth')->group(function () {
  Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
  })->name('dashboard');

  Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
  Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
  Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


  Route::get('/documents/{doc_type}', [DocumentController::class, 'index'])->name('documents.index');
  Route::resource('documents', DocumentController::class, ['except' => ['index']]);


  Route::resource('instances', InstanceController::class);
});

require __DIR__ . '/auth.php';
