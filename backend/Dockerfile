# Étape 1 : Utiliser une image PHP avec Nginx
FROM php:8.2-fpm

# Étape 2 : Installer Nginx et d'autres dépendances nécessaires
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
COPY . /var/www

# Étape 5 : Copier la configuration de Nginx
COPY ./nginx.conf /etc/nginx/sites-available/default

# Étape 6 : Donner les bonnes permissions pour les fichiers Laravel
RUN chown -R www-data:www-data /var/www && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Étape 7 : Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Étape 8 : Installer les dépendances PHP avec Composer
RUN cd /var/www && composer install --no-dev --optimize-autoloader


# Étape 9 : Démarrer Nginx et PHP-FPM
CMD service nginx start && php-fpm
