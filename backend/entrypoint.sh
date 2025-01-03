#!/bin/sh
# Remplacer la variable ${PORT} par sa valeur dans le modèle de configuration
envsubst '\$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Lancer le service nginx et PHP-FPM
exec "$@"
