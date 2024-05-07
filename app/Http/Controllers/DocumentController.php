<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDocumentRequest;
use App\Http\Requests\UpdateDocumentRequest;
use App\Models\Document;
use Inertia\Inertia;

class DocumentController extends Controller
{
  /**
   * Display a listing of the resource.
   */
  public function index()
  {
    return Inertia::render('Dashboard', [
      'incoming_doc_count' => Document::where('type', 'incoming')->count(),
    ]);
  }

  /**
   * Show the form for creating a new resource.
   */
  public function create()
  {
    //
  }

  /**
   * Store a newly created resource in storage.
   */
  public function store(StoreDocumentRequest $request)
  {
    //
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
    //
  }

  /**
   * Update the specified resource in storage.
   */
  public function update(UpdateDocumentRequest $request, Document $document)
  {
    //
  }

  /**
   * Remove the specified resource from storage.
   */
  public function destroy(Document $document)
  {
    //
  }
}
