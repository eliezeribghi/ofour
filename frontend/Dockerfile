# Étape 1 : Construction de l'application frontend
FROM node:latest AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires pour installer les dépendances
COPY frontend/package.json frontend/package-lock.json ./

RUN ls -l /app



# Installer les dépendances en mode production
RUN npm install --production
RUN npm install
# Copier tous les fichiers sources de l'application frontend
COPY ./frontend /app/



# Construire l'application pour la production
RUN npm run build


# Étape 2 : Serveur Nginx pour servir les fichiers statiques
FROM nginx:alpine

# Copier les fichiers générés par le build
COPY --from=build /dist /usr/share/nginx/html/

# Copier la configuration Nginx (chemin adapté)
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Créer le dossier pour les certificats et copier les fichiers SSL
RUN mkdir -p /etc/nginx/ssl
COPY ./nginx/ssl/fullchain.pem /etc/nginx/ssl/fullchain.pem
COPY ./nginx/ssl/privkey.pem /etc/nginx/ssl/privkey.pem

# Remplacer la variable ${PORT} par 80 si aucune valeur n'est définie
RUN sed -i 's/\${PORT}/80/g' /etc/nginx/conf.d/default.conf

# Exposer le port 443 pour HTTPS
EXPOSE 443

# Commande pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
