# Étape 1 : Construction de l'application frontend
FROM node:21.1.0 AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires pour installer les dépendances
COPY package.json package-lock.json ./

# Installer les dépendances en mode production
RUN npm install --production

# Copier tous les fichiers sources de l'application frontend
COPY . .

# Construire l'application pour la production
RUN npm run build

# Étape 2 : Serveur Nginx pour servir les fichiers statiques
FROM nginx:alpine

# Copier les fichiers générés par le build de la première étape
COPY --from=build /app/dist /usr/share/nginx/html/

# Copier votre fichier de configuration Nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Remplacer la variable ${PORT} par la valeur 80 si aucune variable n'est définie
RUN sed -i 's/\${PORT}/80/g' /etc/nginx/conf.d/default.conf

# Exposer le port 80 pour accéder au frontend
EXPOSE 80

# Commande pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
