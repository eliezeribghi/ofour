#!/bin/sh
echo "Listing files in the / directory:"
ls -la /

# Vérifier le répertoire /backend
echo "Listing files in the /backend directory:"
ls -la /backend

# Remplacer la variable ${PORT} par sa valeur dans le modèle de configuration
envsubst '\$PORT' < /backend/nginx.conf > /etc/nginx/nginx.conf

# Lancer le service nginx et PHP-FPM
exec "$@"
