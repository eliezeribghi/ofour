<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\Recette;

class RecetteTest extends TestCase
{
    use RefreshDatabase; // Utilise cette commande pour rafraîchir la base de données à chaque test

    /**
     * Teste que la route GET /api/recettes retourne une réponse valide.
     */
    public function test_get_all_recettes()
    {
        // Crée des recettes factices dans la base de données
        Recette::factory()->count(5)->create();

        // Fait une requête GET vers l'API des recettes
        $response = $this->get('/api/recettes');

        // Vérifie que la réponse est un code HTTP 200
        $response->assertStatus(200);

        // Vérifie que la réponse contient les données des recettes
        $response->assertJsonCount(5);
    }

    /**
     * Teste que la route GET /api/recettes/{id} retourne une recette spécifique.
     */
    public function test_get_single_recette()
    {
        // Crée une recette factice
        $recette = Recette::factory()->create();

        // Fait une requête GET vers l'API pour cette recette
        $response = $this->get('/api/recettes/' . $recette->id);

        // Vérifie que la réponse est un code HTTP 200
        $response->assertStatus(200);

        // Vérifie que la réponse contient les bonnes données
        $response->assertJson([
            'id' => $recette->id,
            'nom' => $recette->nom,
            // Ajoute d'autres champs à vérifier si nécessaire
        ]);
    }
}
