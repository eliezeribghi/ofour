# Utiliser l'image PHP avec Nginx
FROM php:8.2-fpm

# Installer Nginx et d'autres dépendances nécessaires
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
    
# Vérifier les fichiers dans /var/www pour déboguer
RUN ls -al /var/www
RUN ls -al /
# Copier les fichiers du projet dans le conteneur
COPY ./backend /var/www

# Donner les bonnes permissions sur le répertoire backend
RUN chmod -R 755 /var/www



# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installer les dépendances PHP avec Composer
RUN cd /var/www && composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# Copier la configuration Nginx (modèle)
COPY ./backend/nginx.conf /etc/nginx/nginx.conf

# Copier le script d'entrée
COPY ./backend/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Créer les répertoires nécessaires pour Laravel et définir les bonnes permissions
RUN mkdir -p /var/www/storage /var/www/bootstrap/cache && \
    chown -R www-data:www-data /var/www && \
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Définir le port par défaut à 10000
ENV PORT=10000

# Définir le point d'entrée pour démarrer le serveur
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Ne pas inclure la commande CMD ici, car elle est déjà dans entrypoint.sh
