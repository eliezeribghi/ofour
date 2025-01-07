# Étape 1 : Construction de l'application frontend
FROM node:16 AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le package.json et le package-lock.json
COPY frontend/package*.json ./

# Installer les dépendances
RUN npm install

# Copier tous les fichiers sources de l'application frontend
COPY frontend/ ./

# Construire l'application
RUN npm run build

# Étape 2 : Serveur Nginx pour servir les fichiers statiques
FROM nginx:alpine

# Copier les fichiers de build de la première étape
COPY --from=build /app/public /usr/share/nginx/html

# Exposer le port 80 pour accéder au frontend
EXPOSE 80
