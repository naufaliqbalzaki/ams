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
  if (!file_exists(storage_path() . "/db-backup")) {
    mkdir(storage_path() . "/db-backup", 0777, true);
  }

  $filename = 'backup-' . date('Y-m-d-H-i-s') . '.sql';
  $path = storage_path() .  "/db-backup/" . $filename;


  $command = "mysqldump -u " . env('DB_USERNAME') . " -p " . env('DB_DATABASE') . " --password=" . env('DB_PASSWORD')    . " > " . $path;

  exec($command);
  Log::channel('backup')->info('Backup created: ' . $filename);
})->everySecond();
