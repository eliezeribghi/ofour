<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecettesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    // Dans la migration create_recettes_table.php
public function up()
{
    Schema::create('recettes', function (Blueprint $table) {
        $table->id();
        $table->string('titre');
        $table->text('contenu');
        $table->unsignedBigInteger('categorie_id');
        $table->integer('temps_prep');
        $table->integer('temps_cuis');
        $table->string('difficulte');
        $table->string('image_url');
        $table->decimal('note_moyenne', 3, 2)->nullable();
        $table->timestamps();

        $table->foreign('categorie_id')->references('id')->on('categories');
    });
}


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recettes');
    }
}
