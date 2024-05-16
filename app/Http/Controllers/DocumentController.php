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

class DocumentController extends Controller
{
  /**
   * Display a listing of the resource.
   */
  public function index(Request $request)
  {

    $doc_type = $request->query('type');
    $documents = Document::where('doc_type', $doc_type)->get();

    foreach ($documents as $document) {
      $document->instance_name = $document->instance->name;
    }

    return Inertia::render('Documents/Index', [
      'documents' => $documents,
      'doc_type' => $doc_type,
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

    foreach ($sheetData as $key => $value) {
      if (
        $key > 0
      ) {
        $number  = $value[1];
        $from = isset($value[2]) ? $value[2] : null;
        $subject = $value[3];
        $instance_id = $value[4];

        if ($instance_id === null) {
          $instance_id = 1;
        } else {
          $instance = Instance::where('name', $instance_id)->first();
          if ($instance !== null) {
            $instance_id = $instance->id;
          } else {
            $instance_id = 1;
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
    return redirect()->back();
  }
  public function export()
  {

    $documents = Document::all();

    if ($documents->isEmpty()) {
      return redirect()->back()->with('error', 'No documents to export');
    }

    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();



    $sheet->setCellValue('A1', 'Nomor');
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
