import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';

// Configuration Vite
export default defineConfig({
  server: {
    host: '0.0.0.0',
    port: parseInt(process.env.PORT) || 3000,
  },
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
