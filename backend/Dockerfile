# Étape 1 : Utiliser une image PHP avec Nginx
FROM php:8.2-fpm

# Étape 2 : Installer Nginx
RUN apt-get update && apt-get install -y nginx

# Étape 3 : Installer les extensions PHP nécessaires pour Laravel
RUN apt-get install -y \
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

# Étape 4 : Copier les fichiers du projet dans le conteneur
COPY . /var/www

# Étape 5 : Copier la configuration de Nginx
COPY ./nginx.conf /etc/nginx/sites-available/default

# Étape 6 : Donner les bonnes permissions
RUN chown -R www-data:www-data /var/www && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Étape 7 : Exposer les ports nécessaires
EXPOSE 8080

# Étape 8 : Démarrer Nginx et PHP-FPM
CMD service nginx start && php-fpm
