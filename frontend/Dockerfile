# Étape 1 : Construction de l'application frontend
FROM node:18 AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le package.json et le package-lock.json
COPY ./package*.json ./

# Installer les dépendances
RUN npm install

# Copier tous les fichiers sources de l'application frontend
COPY . .

# Construire l'application
RUN npm run build

# Étape 2 : Serveur Nginx pour servir les fichiers statiques
FROM nginx:alpine

# Copier les fichiers de build de la première étape
COPY --from=build /app/dist /usr/share/nginx/html

# Exposer le port 80 pour accéder au frontend
EXPOSE 80
# Démarrer l'application 
CMD ["nginx", "-g", "daemon off;"]