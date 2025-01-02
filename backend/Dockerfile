FROM php:8.2-cli

# Installe les dépendances système
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev \
    zlib1g-dev libzip-dev zip unzip git curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd zip

    RUN chown -R www-data:www-data /var/www/html

# Installe Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html
COPY composer.json composer.lock /var/www/html/

# Définit le répertoire de travail
WORKDIR /var/www/html

# Copie tous les fichiers de l'application
COPY . .

# Donne les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html

# Autorise Composer à s'exécuter avec les privilèges de superutilisateur
ENV COMPOSER_ALLOW_SUPERUSER=1

# Installe les dépendances Laravel
RUN composer install --optimize-autoloader --no-dev

# Donne les permissions nécessaires au dossier de stockage et au cache
RUN chown -R www-data:www-data storage bootstrap/cache

# Commande par défaut pour démarrer l'application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
