<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreInstanceRequest;
use App\Http\Requests\UpdateInstanceRequest;
use App\Models\Instance;
use Inertia\Inertia;

class InstanceController extends Controller
{
  /**
   * Display a listing of the resource.
   */
  public function index()
  {
    return Inertia::render('Instances/Index', [
      'instances' =>  Instance::latest()->get(),
    ]);
  }

  /**
   * Show the form for creating a new resource.
   */
  public function create()
  {
    return Inertia::render('Instances/Create');
  }

  /**
   * Store a newly created resource in storage.
   */
  public function store(StoreInstanceRequest $request)
  {
    $valid = $request->validated();

    if ($request->hasFile('image')) {
      $res = $request->image->store('public/instances');
      $image = explode('/', $res);
      $valid['image'] =  $image[2];
    }

    Instance::create($valid);

    session()->flash('success', 'Berhasil menambahkan dinas baru');
    return redirect()->route('instances.index');
  }

  /**
   * Display the specified resource.
   */
  public function show(Instance $instance)
  {
    //
  }

  /**
   * Show the form for editing the specified resource.
   */
  public function edit(Instance $instance)
  {
    return Inertia::render('Instances/Edit', [
      'instance' => $instance,
    ]);
  }

  /**
   * Update the specified resource in storage.
   */
  public function update(UpdateInstanceRequest $request, Instance $instance)
  {


    $valid = $request->all();

    if ($request->hasFile('image')) {
      $instance->deleteImage();
      $res = $request->image->store('public/instances');
      $image = explode('/', $res);
      $valid['image'] =  $image[2];
    }

    $instance->update($valid);

    session()->flash('success', 'Berhasil mengubah data dinas');
    return redirect()->route('instances.index');
  }

  /**
   * Remove the specified resource from storage.
   */
  public function destroy(Instance $instance)
  {
    $instance->deleteImage();

    $res = $instance->delete();
    if ($res) {
      session()->flash('success', 'Berhasil menghapus dinas');
    } else {
      session()->flash('error', 'Gagal menghapus dinas');
    }
    return redirect()->route('instances.index');
  }
}
