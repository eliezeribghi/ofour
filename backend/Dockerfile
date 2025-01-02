# Utilise une image PHP avec les extensions nécessaires
FROM php:8.2-cli

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

# Vérifiez les permissions
RUN chown -R www-data:www-data /var/www/html

ENV PATH="$PATH:/usr/local/bin"
# Vérifie que Composer est installé
RUN composer --version

# Définit le répertoire de travail
WORKDIR /var/www

# Copier le fichier composer.json et composer.lock
COPY backend/composer.json .
COPY backend/composer.lock .

# Autorise Composer à s'exécuter avec les privilèges de superutilisateur (pour éviter l'avertissement)
ENV COMPOSER_ALLOW_SUPERUSER=1

# Installe les dépendances Laravel
RUN composer clear-cache && composer install --optimize-autoloader --no-dev

# Donne les permissions nécessaires au dossier de stockage et au cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose le port utilisé par PHP-FPM
EXPOSE 9000

# Commande par défaut pour démarrer PHP-FPM
CMD ["php"]
