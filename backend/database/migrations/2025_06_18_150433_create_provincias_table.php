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
        Schema::create('provincias', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_provincia', 100);
            $table->string('capital_provincia', 100);
            $table->text('descripcion_provincia')->nullable();
            $table->string('poblacion_provincia', 50)->nullable();
            $table->string('superficie_provincia', 50)->nullable();
            $table->string('latitud_provincia', 50)->nullable();
            $table->string('longitud_provincia', 50)->nullable();
            $table->foreignId('id_region')->constrained('regions')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('provincias');
    }
};
