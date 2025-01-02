<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRecetteIdToIngredientsTable extends Migration
{
    public function up()
    {
        // Vérifie si la table 'ingredients' existe avant d'ajouter la colonne
        if (Schema::hasTable('ingredients')) {
            // Vérifie si la colonne 'recette_id' n'existe pas déjà
            if (!Schema::hasColumn('ingredients', 'recette_id')) {
                Schema::table('ingredients', function (Blueprint $table) {
                    $table->unsignedBigInteger('recette_id')->nullable(); // Ajoute la colonne recette_id
                    $table->foreign('recette_id')->references('id')->on('recettes')->onDelete('cascade'); // Définis la clé étrangère
                });
            }
        } else {
            // Optionnel : Si la table 'ingredients' n'existe pas, tu peux la créer ici
            Schema::create('ingredients', function (Blueprint $table) {
                $table->id();
                $table->string('nom');
                $table->timestamps();
            });
        }
    }

    public function down()
    {
        // Vérifie si la table 'ingredients' existe avant de tenter de supprimer la colonne
        if (Schema::hasTable('ingredients') && Schema::hasColumn('ingredients', 'recette_id')) {
            Schema::table('ingredients', function (Blueprint $table) {
                $table->dropForeign(['recette_id']); // Supprime la contrainte de clé étrangère
                $table->dropColumn('recette_id'); // Supprime la colonne recette_id
            });
        }
    }
}
