import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';

// URL du backend (conteneur Docker)
const API_URL = "http://localhost:8001";  // Remplacer si nécessaire

// Configuration Vite
export default defineConfig({
  plugins: [svelte()],
  define: {
    // Ajoutez l'URL du backend comme variable globale accessible dans le frontend
    __API_URL__: JSON.stringify(API_URL),
  },
  css: {
    preprocessorOptions: {
      sass: {
        // Configurations Sass ici si nécessaire
      },
    },
  },
});
