<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRecetteIdToIngredientsTable extends Migration
{
    public function up()
    {
        Schema::table('ingredients', function (Blueprint $table) {
            $table->unsignedBigInteger('recette_id');
            $table->foreign('recette_id')->references('id')->on('recettes');
        });
    }

    public function down()
    {
        Schema::table('ingredients', function (Blueprint $table) {
            $table->dropForeign(['recette_id']);
            $table->dropColumn('recette_id');
        });
    }
}

