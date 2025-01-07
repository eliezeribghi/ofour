# # Utiliser l'image PHP avec Nginx
# FROM php:8.2-fpm

# RUN apt-get update && apt-get install -y \
#     nginx \
#     git \
#     unzip \
#     libpng-dev \
#     libjpeg-dev \
#     libfreetype6-dev \
#     libzip-dev \
#     zip \
#     libonig-dev \
#     php7.4-cli \
#     php7.4-mysql \
#     php7.4-gd \
#     php7.4-intl \
#     php7.4-xml \
#     php7.4-zip \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install pdo pdo_mysql gd mbstring zip opcache \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*



# RUN add-apt-repository ppa:ondrej/php -y && \
#     apt-get update

# RUN apt-get update && apt-get install -y \
#     ... \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# ENV PKG_CONFIG_PATH=/usr/lib/pkgconfig


# # Vérifier les fichiers dans /var/www pour déboguer
# RUN ls -al /var/www
# RUN ls -al /

# WORKDIR /var/www

# # Copier les fichiers du projet dans le conteneur
# COPY ./backend /var/www/

# # Donner les bonnes permissions sur le répertoire backend
# RUN chmod -R 755 /var/www

# # Installer Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Installer les dépendances PHP avec Composer
# RUN cd /var/www && composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# # Copier la configuration Nginx
# COPY ./backend/nginx.conf /etc/nginx/nginx.conf

# # Copier le script d'entrée
# COPY ./backend/entrypoint.sh /usr/bin/entrypoint.sh
# RUN chmod +x /usr/bin/entrypoint.sh

# # Créer les répertoires nécessaires pour Laravel et définir les bonnes permissions
# RUN mkdir -p /var/www/storage /var/www/bootstrap/cache && \
#     chown -R www-data:www-data /var/www && \
#     chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B188E2B695BD4743

# # Définir le port par défaut à 10000
# ENV PORT=10000

# # Définir le point d'entrée pour démarrer le serveur
# ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# # N'oublie pas que la commande CMD n'est pas nécessaire ici, car elle est dans entrypoint.sh

FROM php:8.3-apache

ARG WWW_USER=1000

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    zip \
    unzip \
    default-mysql-client

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd zip curl intl

# Copy vhost config
COPY ./backend/vhost.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache mods
RUN a2enmod rewrite

# Get latest Composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# Create user
RUN groupadd --force -g $WWW_USER webapp
RUN useradd -ms /bin/bash --no-user-group -g $WWW_USER -u $WWW_USER webapp

# Clean cache
RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${WWW_USER}
