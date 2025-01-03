#!/bin/sh

# Vérifier si le répertoire /backend existe
if [ ! -d "/backend" ]; then
  echo "Le répertoire /backend n'existe pas."
  exit 1
fi

# Remplacer la variable ${PORT} par sa valeur dans le modèle de configuration
envsubst '\$PORT' < /backend/nginx.conf > /etc/nginx/nginx.conf

# Lancer le service nginx et PHP-FPM
exec "$@"
