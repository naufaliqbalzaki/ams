<?php

namespace App\Http\Controllers;

use GuzzleHttp\Psr7\Request;
use Inertia\Inertia;

class BackupController extends Controller
{
  public function index()
  {
    if (!file_exists(storage_path() . "/db-backup")) {
      mkdir(storage_path() . "/db-backup", 0777, true);
    }

    $files = array_diff(scandir(storage_path() . "/db-backup"), array('.', '..'));
    $files = array_values($files);
    $files = array_map(function ($file) {
      return [
        'no' => 1,
        'name' => $file,
        'size' => filesize(storage_path() . "/db-backup/" . $file),
        'created_at' => date('Y-m-d H:i:s', filectime(storage_path() . "/db-backup/" . $file)),
      ];
    }, $files);

    usort($files, function ($a, $b) {
      return $a['created_at'] < $b['created_at'];
    });

    // add tag new for file created in last 24 hours
    $files = array_map(function ($file) {
      $file['no'] = 1;
      $file['created_at'] = date('Y-m-d H:i:s', filectime(storage_path() . "/db-backup/" . $file['name']));
      $file['new'] = strtotime($file['created_at']) > strtotime('-24 hours');
      return $file;
    }, $files);

    return Inertia::render('Backup/Index', [
      'files' => $files
    ]);
  }

  public function create()
  {
    // 6 digit hash
    $name =   substr(md5(rand()), 0, 6);
    $path = storage_path() .  "/db-backup/backup-" . $name . ".sql";
    if (!file_exists(storage_path() . "/db-backup")) {
      mkdir(storage_path() . "/db-backup", 0777, true);
    }
    $command = "mysqldump -u " . env('DB_USERNAME') . " -p " . env('DB_DATABASE') . " --password=" . env('DB_PASSWORD')    . " > " . $path;
    exec($command);
    return redirect()->route('backups.index')->with('success', 'Backup database berhasil dibuat');
  }

  public function download($name)
  {
    $file = storage_path() . "/db-backup/" . $name;
    $headers = array(
      'Content-Type: application/sql',
    );
    return response()->download($file, 'backups.sql', $headers);
  }
}
