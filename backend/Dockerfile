# Utilise une image PHP avec les extensions nécessaires
FROM php:8.2-fpm

# Installe les dépendances système
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd

# Installe Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Définit le répertoire de travail
WORKDIR /var/www

# Copie les fichiers de l'application dans le conteneur
COPY . .

# Installe les dépendances Laravel
RUN composer install --optimize-autoloader --no-dev

# Donne les permissions nécessaires au dossier de stockage et au cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose le port utilisé par PHP-FPM
EXPOSE 9000

# Commande par défaut pour démarrer PHP-FPM
CMD ["php-fpm"]
