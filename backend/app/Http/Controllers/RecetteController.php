<?php


namespace App\Http\Controllers;

use App\Models\Recette;
use App\Models\Ingredients;
use App\Models\EtapesPreparation;
use Illuminate\Http\Request;
use Illuminate\View\View;

class RecetteController extends Controller
{
    /**
     * Affiche les détails d'une recette spécifique.
     *
     * @param  string  $recetteId  L'identifiant de la recette à afficher.
     * @return View
     */
    public function list()

    {
        try {
          // Récupérer toutes les recettes avec leurs ingrédients associés et les images
          $recettes = Recette::with(['categorie','ingredients', 'ingredients.recettes', 'etapesPreparation', 'recetteIngredients.ingredient' ])
          ->get()
          ->map(function ($recette): mixed {
              $recette->image_url = asset('images/' . $recette->image_url);
              return $recette;
          });
        //   ->map(function ($recette) { ... }): La méthode map() est utilisée pour itérer sur chaque recette dans la collection résultante. Pour chaque recette, la fonction de rappel (callback) est exécutée. Dans ce cas, elle ajoute l'URL de l'image à la recette en utilisant la fonction asset(). La fonction asset() génère l'URL complet vers un fichier ou une ressource en utilisant le gestionnaire d'URL de Laravel. L'URL de l'image est basée sur le champ image_url de chaque recette.
            return response()->json($recettes);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erreur lors de la récupération des recettes.'], 500);
        }
    }

/**
     * Affiche les détails d'une recette spécifique.
     *
     * @param  int  $id  L'identifiant de la recette à afficher.
     * @return \Illuminate\Http\JsonResponse
     */

     public function show($id): mixed
     {
         try {
             $recette = Recette::with(['etapesPreparation', 'recetteIngredients.ingredient', 'categorie'])
                 ->findOrFail($id);
     
             // Ajoute l'URL complète de l'image
             $recette->image_url = asset('images/' . $recette->image_url);
     
             return response()->json($recette);
         } catch (\Exception $e) {
             return response()->json(['error' => 'Erreur lors de la récupération des détails de la recette.'], 500);
         }
     }
     
}






  /*   public function show(string $recetteId): View
    {
        // Récupérer la recette depuis la base de données en utilisant l'ID fourni.
        $recette = Recette::findOrFail($recetteId);

        // Récupérer les ingrédients de la recette depuis la base de données en utilisant la relation définie dans le modèle.
        $ingredients = Ingredients::where('recette_id', $recette->id)->get();

        // Récupérer les étapes de préparation de la recette depuis la base de données en utilisant la relation définie dans le modèle.
        $etapesPreparation = EtapesPreparation::where('recette_id', $recette->id)->get();

        // Passer les données à la vue recettes.show. Ces données seront accessibles dans la vue.
        return view('recettes.show', [
            'recette' => $recette, // Passer l'objet Recette à la vue.
            'ingredients' => $ingredients, // Passer la collection d'objets Ingredients à la vue.
            'etapesPreparation' => $etapesPreparation // Passer la collection d'objets EtapesPreparation à la vue.
        ]);
    } */


