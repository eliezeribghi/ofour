# Utiliser l'image PHP de base
FROM php:8.2-fpm

# Définir le répertoire de travail
WORKDIR /app

# Installer les dépendances système et les extensions PHP nécessaires



# Installation des dépendances et des extensions PHP
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Installer Composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# Copier les fichiers de l'application dans le conteneur
COPY . /app

# Nettoyer les fichiers temporaires
RUN apt-get clean && rm -rf /var/lib/apt/lists/*



# Ajouter un script pour vérifier que MySQL est en ligne
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Remplacer la commande par défaut pour inclure le script de vérification
CMD ["/usr/local/bin/start.sh"]
