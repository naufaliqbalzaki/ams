<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schedule;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Log;

Artisan::command('inspire', function () {
  $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote')->hourly();

Schedule::call(function () {
  $filename = 'backup-' . date('Y-m-d-H-i-s') . '.sql';
  $command = 'mysqldump -u ' . env('DB_USERNAME') . ' -p' . env('DB_PASSWORD') . ' ' . env('DB_DATABASE') . ' > ' . storage_path('app/backup/') . $filename;

  $returnVar = NULL;
  $output  = NULL;

  exec($command, $output, $returnVar);
  Log::channel('backup')->info('Backup created: ' . $filename);
})->monthly();
