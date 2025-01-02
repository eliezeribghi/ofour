# Étape 1 : Utiliser une image officielle PHP pour Laravel avec PHP-FPM
FROM php:8.2-fpm

# Étape 2 : Installer les extensions PHP nécessaires pour Laravel
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd mbstring zip opcache

# Étape 3 : Installer Composer (gestionnaire de dépendances PHP)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Étape 4 : Définir le répertoire de travail
WORKDIR /var/www

# Étape 5 : Copier les fichiers nécessaires
COPY . .

# Étape 6 : Donner les permissions au répertoire storage et bootstrap/cache
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Étape 7 : Optimiser Laravel pour la production (facultatif)
RUN php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache

# Étape 8 : Exposer le port pour PHP-FPM
EXPOSE 9000

# Commande par défaut pour démarrer PHP-FPM
CMD ["php-fpm"]

