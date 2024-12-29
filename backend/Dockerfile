# Utilise une image PHP avec les extensions nécessaires
FROM php:8.3-cli

# Installe les dépendances système
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    zlib1g-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd zip

# Copier le fichier composer.json
COPY composer.json .

# Installe les dépendances Laravel
RUN composer install --optimize-autoloader --no-dev

# Définit le répertoire de travail
WORKDIR /var/www

# Copie les fichiers de l'application dans le conteneur
COPY . .

# Autorise Composer à s'exécuter avec les privilèges de superutilisateur (pour éviter l'avertissement)
ENV COMPOSER_ALLOW_SUPERUSER=1

# Installe les dépendances Laravel
RUN composer install --optimize-autoloader --no-dev

# Génère l'autoload de Composer
RUN composer dump-autoload --optimize

# Donne les permissions nécessaires au dossier de stockage et au cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose le port utilisé par PHP-FPM
EXPOSE 9000

# Commande par défaut pour démarrer PHP-FPM
CMD ["php-fpm"]
