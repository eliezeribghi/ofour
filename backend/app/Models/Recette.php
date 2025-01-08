<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;

use App\Models\EtapePreparation;
use App\Models\RecetteIngredient;
use App\Models\Categorie;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Recette extends Model
{
    use HasFactory;
    // Nom de la table dans la base de données associée à ce modèle
    protected $table = 'recettes';

    // Relation avec le modèle Ingredients : une recette peut avoir plusieurs ingrédients
    public function ingredients()
    {
        return $this->belongsToMany(Ingredient::class, 'recette_ingredients', 'recette_id', 'ingredient_id')
        ->withPivot('quantite')
        ->withTimestamps();
    }

    // Relation avec le modèle EtapesPreparation : une recette peut avoir plusieurs étapes de préparation
//     public function etapesPreparation()
//     {
//         return $this->hasMany(EtapesPreparation::class, 'recette_id')->orderBy('ordre');
//     }
//     public function recette()
// {
//     return $this->belongsTo(Recette::class, 'recette_id');
// }
public function etapesPreparation()
    {
        return $this->hasMany(EtapePreparation::class);
    }

    public function recetteIngredients()
    {
        return $this->hasMany(RecetteIngredient::class);
    }

    public function categorie()
    {
        return $this->belongsTo(Categorie::class);
    }

}

