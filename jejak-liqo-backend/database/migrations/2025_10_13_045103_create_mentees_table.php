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
        Schema::create('mentees', function (Blueprint $table) {
            $table->id();
            $table->foreignId('group_id')->constrained('groups')->onDelete('cascade');
            $table->string('full_name', 100);
            $table->string('nickname', 50)->nullable();
            $table->date('birth_date')->nullable();
            $table->string('phone_number', 20)->nullable();
            $table->string('activity_class', 50)->nullable();
            $table->string('hobby', 100)->nullable();
            $table->text('address')->nullable();
            $table->enum('status', ['Aktif', 'Lulus', 'Nonaktif'])->default('Aktif');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mentees');
    }
};