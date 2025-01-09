# Utiliser l'image PHP de base
FROM php:8.2-fpm

# Installer les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    zip git libonig-dev libzip-dev unzip libxml2-dev \
    procps psmisc && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql mbstring zip


# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définir le répertoire de travail
WORKDIR /var/www

# Copier les fichiers du projet
COPY . /var/www
COPY ./.env /var/www/.env

# Installer les dépendances Laravel
RUN composer install --no-dev --optimize-autoloader

# Ajuster les permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage \
    && chmod -R 775 /var/www/bootstrap/cache

# Exposer le port 8080
EXPOSE 8080

# Commande par défaut
CMD ["php-fpm"]
