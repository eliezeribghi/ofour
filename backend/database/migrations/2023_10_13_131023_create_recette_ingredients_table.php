<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecetteIngredientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
   // Dans la migration create_recette_ingredients_table.php
public function up()
{
    Schema::create('recette_ingredients', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('recette_id');
        $table->unsignedBigInteger('ingredient_id');
        $table->integer('quantite');
        $table->timestamps();

        $table->foreign('recette_id')->references('id')->on('recettes');
        $table->foreign('ingredient_id')->references('id')->on('ingredients');
    });
}


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recette_ingredients');
    }
}
