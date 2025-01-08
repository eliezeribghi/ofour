import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';

// Configuration Vite
export default defineConfig({
 
  plugins: [svelte()],
  define: {

  },
  css: {
    preprocessorOptions: {
      sass: {
           api: 'modern-compiler'
      },
    },
  },
});
