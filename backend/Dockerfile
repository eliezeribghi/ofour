# Étape 1 : Utiliser une image officielle PHP
FROM php:8.2-fpm

# Étape 2 : Installer les extensions PHP nécessaires pour Laravel
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    zip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd mbstring zip opcache

# Étape 3 : Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Étape 4 : Définir le répertoire de travail
WORKDIR /var/www

# Étape 5 : Créer le répertoire et configurer les permissions
RUN mkdir -p /var/www/storage /var/www/bootstrap/cache \
    && chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Étape 6 : Copier les fichiers du projet
COPY . .

# Étape 7 : Exposer le port 9000
EXPOSE 9000

# Commande par défaut
CMD ["php-fpm"]
