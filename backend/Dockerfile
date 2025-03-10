# Utiliser l'image PHP de base
FROM php:8.2-fpm

# Définir le répertoire de travail
WORKDIR /app

# Installation des dépendances système et des extensions PHP
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Installer Composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# Copier les fichiers de l'application dans le conteneur
COPY . /app


# Ajouter un script pour vérifier que MySQL est en ligne
COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Définir la commande par défaut
CMD ["/usr/local/bin/start.sh"]
