<?php

use App\Http\Controllers\BackupController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\InstanceController;
use App\Http\Controllers\ReportController;
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

    $instances  = Instance::latest()->get();
    // $instance_inactive = Instance::where('is_active', 0)->get();

    $data = array(
      'doc_central' => [
        'name' => 'Surat Masuk Pusat',
        'data' => $doc_central,
        'unit' => 'surat'
      ],
      'doc_east' => [
        'name' => 'Surat Masuk Timur',
        'data' => $doc_east,
        'unit' => 'surat'
      ],
      'instance_active' => [
        'name' => 'Dinas',
        'data' => $instances,
        'unit' => 'dinas'
      ],
      // 'instance_inactive' => [
      //   'name' => 'Dinas Tidak Aktif',
      //   'data' => $instance_inactive,
      //   'unit' => 'dinas'
      // ],
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
  Route::get('/download-template', [DocumentController::class, 'download_template'])->name('documents.download_template');

  Route::get('/backups', [BackupController::class, 'index'])->name('backups.index');
  Route::get('/backups/create', [BackupController::class, 'create'])->name('backups.create');
  Route::get('/backups/download/{name}', [BackupController::class, 'download'])->name('backups.download');

  Route::get('/reports', [ReportController::class, 'index'])->name('reports.index');
  Route::get('/reports/download', [ReportController::class, 'download'])->name('reports.download');
});

require __DIR__ . '/auth.php';
