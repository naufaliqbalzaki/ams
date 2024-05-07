<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  /**
   * Run the migrations.
   */
  public function up(): void
  {
    Schema::create('documents', function (Blueprint $table) {
      $table->id();
      $table->foreignId('user_id')->constrained()->cascadeOnDelete();
      $table->foreignId('instance_id')->constrained()->cascadeOnDelete();
      $table->enum('doc_type', ['central', 'east']);
      $table->enum('type', ['incoming', 'outcoming']);
      $table->string('number')->unique();
      $table->date('date');
      $table->text('subject');
      $table->string('from');
      $table->string('to');
      $table->string('file');
      $table->string('phone');
      $table->mediumText('next_action')->nullable();
      $table->mediumText('corrective_action')->nullable();
      $table->mediumText('descripion')->nullable();
      $table->timestamps();
    });
  }

  /**
   * Reverse the migrations.
   */
  public function down(): void
  {
    Schema::dropIfExists('documents');
  }
};
