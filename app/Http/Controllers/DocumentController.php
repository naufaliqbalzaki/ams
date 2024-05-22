<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDocumentRequest;
use App\Http\Requests\UpdateDocumentRequest;
use App\Models\Document;
use App\Models\Instance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Symfony\Component\HttpFoundation\File\File;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class DocumentController extends Controller
{
  /**
   * Display a listing of the resource.
   */
  public function index(Request $request)
  {

    $doc_type = $request->query('type');
    $documents = Document::where('doc_type', $doc_type)->latest()->get();

    foreach ($documents as $document) {
      $document->instance_name = $document->instance->name;
    }

    $unique = $documents->unique('from');
    $summary = $unique->map(function ($item) use ($documents) {
      $total = $documents->where('from', $item->from)->count();
      $corrective_action = $documents->where('from', $item->from)->whereNotNull('corrective_action');
      $corrective_action_count = $corrective_action->count();
      $corrective_action_last = $corrective_action->last();
      $next_action_count = $documents->where('from', $item->from)->whereNotNull('next_action')->count();
      return [
        'from' => $item->from,
        'subject' => $item->subject,
        'total' => $total,
        'corrective_action_count' => $corrective_action_count,
        'next_action_count' => $next_action_count,
        'corrective_action_last_date' => $corrective_action_last ? $corrective_action_last->created_at : null,
      ];
    })->toArray();



    return Inertia::render('Documents/Index', [
      'documents' => $documents,
      'doc_type' => $doc_type,
      'summary' => $summary,
    ]);
  }

  /**
   * Show the form for creating a new resource.
   */
  public function create()
  {
    $instances = Instance::all();
    return Inertia::render('Documents/Create', [
      'instances' => $instances,
    ]);
  }

  /**
   * Store a newly created resource in storage.
   */
  public function store(StoreDocumentRequest $request)
  {
    $valid = $request->validated();

    $valid['issue_date'] = date('Y-m-d H:i:s', strtotime($valid['issue_date']));
    $valid['verification_date'] =  date('Y-m-d H:i:s', strtotime($valid['verification_date']));

    if ($request->hasFile('file')) {
      $res = $request->file->store('public/documents');
      $file = explode('/', $res);
      $valid['file'] =  $file[2];
    }

    Document::create($valid);

    session()->flash('success', 'Berhasil menambahkan dokumen baru');
    return redirect()->route('documents.index', [
      'type' => $valid['doc_type'],
    ]);
  }

  /**
   * Display the specified resource.
   */
  public function show(Document $document)
  {
    //
  }

  /**
   * Show the form for editing the specified resource.
   */
  public function edit(Document $document)
  {
    $document->instance_id = (string) $document->instance_id;
    if ($document->file) {
      $localPath = storage_path('app/public/documents/' . $document->file);
      $document->file = new File($localPath);
    }
    return Inertia::render('Documents/Edit', [
      'document' => $document,
      'instances' => Instance::all(),
    ]);
  }

  /**
   * Update the specified resource in storage.
   */
  public function update(UpdateDocumentRequest $request, Document $document)
  {
    $valid = $request->validated();
    $valid['issue_date'] = date('Y-m-d H:i:s', strtotime($valid['issue_date']));
    $valid['verification_date'] =  date('Y-m-d H:i:s', strtotime($valid['verification_date']));

    if ($request->hasFile('file')) {
      $document->deleteFile();
      $res = $request->file->store('public/documents');
      $file = explode('/', $res);
      $valid['file'] =  $file[2];
    }

    $document->update($valid);

    session()->flash('success', 'Berhasil mengubah dokumen');
    return redirect()->route('documents.index', [
      'type' => $valid['doc_type'],
    ]);
  }

  /**
   * Remove the specified resource from storage.
   */
  public function destroy(Document $document)
  {
    if (isset($document->file)) {
      $document->deleteFile();
    };
    $document->delete();
    session()->flash('success', 'Berhasil menghapus dokumen');
    return redirect()->route('documents.index', [
      'type' => $document->doc_type,
    ]);
  }

  public function destroyBatch(Request $request)
  {
    $ids = $request->input('ids');
    $count = count($ids);
    foreach ($ids as $id) {
      $document = Document::find($id);
      if ($document) {
        if (isset($document->file)) {
          $document->deleteFile();
        }
        $document->delete();
      }
    }
    session()->flash('success', $count . ' dokumen berhasil dihapus');
    return redirect()->route('documents.index', [
      'type' => $request->input('doc_type'),
    ]);
  }

  public function import(Request $request)
  {
    try {

      $request->validate([
        'xlsx' => 'required|mimes:xlsx,xls',
        'doc_type' => 'required|string',
      ]);

      $file = $request->file('xlsx');
      $fileName = time() . '_' . $file->getClientOriginalName();
      $file->storeAs('public/documents/imports', $fileName);
      if (!file_exists(storage_path('app/public/documents/imports/' . $fileName))) {
        session()->flash('error', 'Failed to import documents');
        return redirect()->back();
      }

      $spreadsheet = IOFactory::load(storage_path('app/public/documents/imports/' . $fileName));
      $sheetData = $spreadsheet->getActiveSheet()->toArray();

      for ($i = 0; $i < 3; $i++) {
        array_shift($sheetData);
      }

      $count = 0;
      $latest = Instance::latest()->first();

      foreach ($sheetData as $key => $value) {
        if (
          $key > 0
        ) {
          $number  = $value[1];
          $from = $value[2];
          $subject = $value[3];
          $instance_name = $value[4];
          $instance_id = 2;
          if ($instance_name === null) {
            $instance_id = $latest->id;
          } else {
            $instance = Instance::where('name', 'like', '%' . $instance_name . '%')->first();
            if ($instance) {
              $instance_id = $instance->id;
            } else {
              $instance = Instance::create([
                'name' => $instance_name,
              ]);
            }
          }

          $next_action  = $value[5];
          $corrective_action = $value[6];
          $issue_date  = $value[7] !== null && (strtotime($value[7])) ? date('Y-m-d', strtotime($value[7])) : null;
          $issue_time  =  $value[8] !== null && (strtotime($value[8])) ? date('H:i:s', strtotime($value[8])) : null;

          $verification_date = $value[9] !== null && (strtotime($value[9])) ? date('Y-m-d', strtotime($value[9])) : null;
          $verification_time  =  $value[10] !== null && (strtotime($value[10])) ? date('H:i:s', strtotime($value[10])) : null;
          $description  = $value[11];
          $phone = $value[12];

          if ($from !== null) {
            Document::create([
              'user_id' => auth()->id(),
              'number' => $number,
              'from' => $from,
              'subject' => $subject,
              'instance_id' => $instance_id,
              'doc_type' => $request->doc_type,
              'next_action' => $next_action,
              'corrective_action' => $corrective_action,
              'issue_date' => $issue_date . ' ' . $issue_time,
              'verification_date' => $verification_date . ' ' . $verification_time,
              'description' => $description,
              'phone' => $phone,
            ]);
            $count++;
          }
        }
      }

      session()->flash('success', $count . ' ' . $request->type . ' documents imported successfully');
      return redirect()->route('documents.index', [
        'type' => $request->doc_type,
      ]);
    } catch (\Throwable $th) {
      Log::alert("IMPORT DOC ERR" . $th);
    }
  }
  public function export()
  {

    $documents = Document::all();

    if ($documents->isEmpty()) {
      return redirect()->back()->with('error', 'No documents to export');
    }

    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    $sheet->getColumnDimension('A')->setWidth(7);
    $sheet->getColumnDimension('C')->setWidth(30);
    $sheet->getColumnDImension('D')->setWidth(70);
    $sheet->getColumnDimension('E')->setWidth(40);
    $sheet->getColumnDimension('F')->setWidth(50);
    $sheet->getColumnDimension('G')->setWidth(50);
    $sheet->getColumnDimension('H')->setWidth(25);
    $sheet->getColumnDimension('I')->setWidth(25);
    $sheet->getColumnDimension('J')->setWidth(25);
    $sheet->getColumnDimension('K')->setWidth(20);

    $sheet->setCellValue('A1', 'No.');
    $sheet->setCellValue('B1', 'Kantor');
    $sheet->setCellValue('C1', 'Pemohon');
    $sheet->setCellValue('D1', 'Perizinan');
    $sheet->setCellValue('E1', 'Dinas');
    $sheet->setCellValue('F1', 'Tindak Lanjut');
    $sheet->setCellValue('G1', 'Tindakan Koreksi');
    $sheet->setCellValue('H1', 'Tanggal Terbit');
    $sheet->setCellValue('I1', 'Tanggal Verifikasi');
    $sheet->setCellValue('J1', 'Keterangan');
    $sheet->setCellValue('K1', 'Telepon');

    $headerStyle = [
      'font' => [
        'bold' => true,
        'size' => 14,
        'color' => [
          'rgb' => 'FFFFFF'
        ]
      ],
      'alignment' => [
        'horizontal' => Alignment::HORIZONTAL_CENTER,
        'vertical' => Alignment::VERTICAL_CENTER,
      ],
      'fill' => [
        'fillType' => Fill::FILL_SOLID,
        'startColor' => [
          'argb' => 'FF137553',
        ],
      ],
      'borders' => [
        'allBorders' => [
          'borderStyle' => Border::BORDER_THIN,
          'color' => ['argb' => 'FF000000'],
        ],
      ],
    ];
    $sheet->getStyle('A1:K1')->applyFromArray($headerStyle);
    $sheet->getRowDimension('1')->setRowHeight(30);

    $row = 2;
    foreach ($documents as $document) {
      $sheet->setCellValue('A' . $row, $document->number);
      $sheet->setCellValue('B' . $row, $document->doc_type == 'central' ? 'Pusat' : 'Timur');
      $sheet->setCellValue('C' . $row, $document->from);
      $sheet->setCellValue('D' . $row, $document->subject);
      $sheet->setCellValue('E' . $row, $document->instance->name);
      $sheet->setCellValue('F' . $row, $document->next_action);
      $sheet->setCellValue('G' . $row, $document->corrective_action);
      $sheet->setCellValue('H' . $row, $document->issue_date);
      $sheet->setCellValue('I' . $row, $document->verification_date);
      $sheet->setCellValue('J' . $row, $document->description);
      $sheet->setCellValue('K' . $row, $document->phone);

      $borderStyle = [
        'borders' => [
          'allBorders' => [
            'borderStyle' => Border::BORDER_THIN,
            'color' => ['argb' => 'FF000000'],
          ],
        ],
      ];

      $sheet->getStyle('A' . $row . ':K' . $row)->applyFromArray($borderStyle);
      $sheet->getStyle('A' . $row . ':B' . $row)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

      $row++;
    }

    $writer = new Xlsx($spreadsheet);
    $fileName = 'documents_' . time() . '.xlsx';
    $filePath = storage_path('app/public/documents/exports/' . $fileName);

    if (!file_exists(dirname($filePath))) {
      mkdir(dirname($filePath), 0777, true);
    }

    $writer->save($filePath);

    return response()->download($filePath)->deleteFileAfterSend(true);
  }
}
