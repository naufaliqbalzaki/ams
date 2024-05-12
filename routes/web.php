<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\InstanceController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\Document;
use App\Models\Instance;
use Illuminate\Support\Facades\DB;


Route::redirect('/', '/dashboard');


Route::middleware('auth')->group(function () {
  Route::get('/dashboard', function () {
    $doc_central = Document::where('doc_type', 'central')->get();
    $doc_east = Document::where('doc_type', 'east')->get();

    $instance_active = Instance::where('is_active', 1)->get();
    $instance_inactive = Instance::where('is_active', 0)->get();

    $data = array(
      'doc_central' => [
        'name' => 'Central Documents',
        'data' => $doc_central,
        'unit' => 'doc'
      ],
      'doc_east' => [
        'name' => 'East Documents',
        'data' => $doc_east,
        'unit' => 'doc'
      ],
      'instance_active' => [
        'name' => 'Active Instances',
        'data' => $instance_active,
        'unit' => 'instance'
      ],
      'instance_inactive' => [
        'name' => 'Deactive Instances',
        'data' => $instance_inactive,
        'unit' => 'instance'
      ],
    );
    return Inertia::render('Dashboard', [
      'data' => $data
    ]);
  })->name('dashboard');

  Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
  Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
  Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


  Route::resource('instances', InstanceController::class);

  Route::resource('documents', DocumentController::class,);
  Route::post('/documents/import', [DocumentController::class, 'import'])->name('documents.import');
  Route::get('/documents/file/export', [DocumentController::class, 'export'])->name('documents.file.export');
  Route::post('/documents/destroy_batch', [DocumentController::class, 'destroyBatch'])->name('documents.destroy_batch');
});

require __DIR__ . '/auth.php';
