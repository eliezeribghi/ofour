# Utilise une image PHP avec les extensions nécessaires
FROM php:8.3-cli
RUN composer --version
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

# Installe Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définit le répertoire de travail
WORKDIR /var/www
COPY backend/composer.lock .

# Copier le fichier composer.json
COPY backend/composer.json .

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
