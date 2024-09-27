<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Recette;

class RecetteFactory extends Factory
{
    protected $model = Recette::class;

    public function definition()
    {
        return [
            'nom' => $this->faker->word,
            'description' => $this->faker->sentence,
            'temps_preparation' => $this->faker->numberBetween(10, 60), // par exemple en minutes
        ];
    }
}

