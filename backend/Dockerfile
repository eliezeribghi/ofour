# Étape 1 : Utiliser une image PHP avec FPM
FROM php:8.2-fpm

# Étape 2 : Installer Nginx et les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    nginx \
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
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Étape 4 : Copier les fichiers du projet dans le conteneur
COPY ./backend /var/www

# Étape 5 : Copier la configuration de Nginx
COPY ./backend/nginx.conf /etc/nginx/nginx.conf

# Étape 6 : Ajuster les permissions
RUN mkdir -p /var/www/storage /var/www/bootstrap/cache && \
    chown -R www-data:www-data /var/www && \
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Étape 7 : Installer les dépendances PHP avec Composer
WORKDIR /var/www
RUN composer install --no-dev --optimize-autoloader

# Étape 8 : Exposer le port défini
EXPOSE 10000

# Étape 9 : Démarrer Nginx et PHP-FPM
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
