# Étape 1 : Construction avec une version récente de Node.js
FROM node:18-alpine AS build

WORKDIR /app

# Copier les fichiers nécessaires pour installer les dépendances
COPY package*.json pnpm-lock.yaml ./

# Installer PNPM et les dépendances
RUN npm install -g pnpm && pnpm install

# Copier tout le projet et construire l'application
COPY . .
RUN pnpm run build

# Étape 2 : Serveur Nginx pour servir les fichiers statiques
FROM nginx:alpine

# Copier les fichiers générés dans "dist" vers Nginx
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;" ]
