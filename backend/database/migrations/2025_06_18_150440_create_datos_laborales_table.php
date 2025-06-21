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
        Schema::create('datos_laborales', function (Blueprint $table) {
            $table->id();
            $table->foreignId('empleado_id')->constrained('empleados')->onDelete('cascade');
            $table->string('division')->nullable();
            $table->string('departamento')->nullable();
            $table->string('seccion')->nullable();
            $table->string('cargo')->nullable();
            $table->date('fecha_ingreso')->nullable();
            $table->enum('status', ['VIGENTE', 'RETIRADO'])->default('VIGENTE');
            $table->decimal('sueldo', 10, 2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('datos_laborales');
    }
};
