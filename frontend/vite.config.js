import { defineConfig } from "vite";
import { svelte } from "@sveltejs/vite-plugin-svelte";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [svelte()],
  root: "./", // spécifie que la racine du projet est à la racine du dossier frontend
  build: {
    outDir: '../dist', // le dossier de sortie après le build
  },
  css: {
    preprocessorOptions: {
      sass: {
        // Configurations Sass ici
      },
    },
  },
});
