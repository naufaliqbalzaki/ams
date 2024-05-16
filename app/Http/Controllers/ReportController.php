<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ReportController extends Controller
{
  public function index()
  {
    $approved_subjects = DB::table('documents')
      ->select('subject', DB::raw('count(*) as approved_total'))
      ->whereNotNull('corrective_action')
      ->groupBy('subject')
      ->get();

    $correction_subjects = DB::table('documents')
      ->select('subject', DB::raw('count(*) as corrective_total'))
      ->whereNotNull('next_action')
      ->groupBy('subject')
      ->get();

    $subjects = $approved_subjects->merge($correction_subjects);
    $subjects = array_map(function ($subject) use ($approved_subjects, $correction_subjects) {
      $approved = $approved_subjects->firstWhere('subject', $subject->subject);
      $correction = $correction_subjects->firstWhere('subject', $subject->subject);

      return [
        'subject' => $subject->subject,
        'approved_total' => $approved ? $approved->approved_total : 0,
        'corrective_total' => $correction ? $correction->corrective_total : 0,
        'total' => ($approved ? $approved->approved_total : 0) + ($correction ? $correction->corrective_total : 0),
      ];
    }, $subjects->toArray());

    return Inertia::render('Reports/Index', [
      'subjects' => $subjects,
    ]);
  }

  public function download()
  {
    $approved_subjects = DB::table('documents')
      ->select('subject', DB::raw('count(*) as approved_total'))
      ->whereNotNull('corrective_action')
      ->groupBy('subject')
      ->get();

    $correction_subjects = DB::table('documents')
      ->select('subject', DB::raw('count(*) as corrective_total'))
      ->whereNotNull('next_action')
      ->groupBy('subject')
      ->get();

    $subjects = $approved_subjects->merge($correction_subjects);
    $subjects = array_map(function ($subject) use ($approved_subjects, $correction_subjects) {
      $approved = $approved_subjects->firstWhere('subject', $subject->subject);
      $correction = $correction_subjects->firstWhere('subject', $subject->subject);

      return [
        'subject' => $subject->subject,
        'approved_total' => $approved ? $approved->approved_total : 0,
        'corrective_total' => $correction ? $correction->corrective_total : 0,
        'total' => ($approved ? $approved->approved_total : 0) + ($correction ? $correction->corrective_total : 0),
      ];
    }, $subjects->toArray());


    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1', 'Perizinan');
    $sheet->setCellValue('B1', 'Disetujui');
    $sheet->setCellValue('C1', 'Ditolak');
    $sheet->setCellValue('D1', 'Total');

    $row = 2;
    foreach ($subjects as $subject) {
      $sheet->setCellValue('A' . $row, $subject['subject']);
      $sheet->setCellValue('B' . $row, $subject['approved_total']);
      $sheet->setCellValue('C' . $row, $subject['corrective_total']);
      $sheet->setCellValue('D' . $row, $subject['total']);
      $row++;
    }

    $writer = new Xlsx($spreadsheet);
    $fileName = 'report-' . date('Y-m-d-H-i-s') . '.xlsx';

    $filePath = storage_path('app/public/documents/reports/' . $fileName);

    if (!file_exists(dirname($filePath))) {
      mkdir(dirname($filePath), 0777, true);
    }

    $writer->save($filePath);

    return response()->download($filePath)->deleteFileAfterSend(true);
  }
}
