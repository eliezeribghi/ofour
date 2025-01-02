FROM php:8.2-cli

# Affiche le contenu du répertoire
RUN ls -la

# Installe les dépendances système
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev \
    zlib1g-dev libzip-dev zip unzip git curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd zip

# Installe Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définit le répertoire de travail
WORKDIR /var/www/html

# Copie les fichiers composer
COPY composer.lock ./

# Autorise Composer à s'exécuter avec les privilèges de superutilisateur
ENV COMPOSER_ALLOW_SUPERUSER=1

# Installe les dépendances Laravel
RUN composer install --no-dev --no-scripts --no-autoloader
# Copie le reste des fichiers de l'application
COPY . .
RUN composer dump-autoload --optimize
# Donne les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 storage bootstrap/cache

# Commande par défaut pour démarrer l'application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
