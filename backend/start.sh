#!/bin/bash

# Vérifier que MySQL est en ligne
while ! mysqladmin ping -h"mysql" -P"3306" -u"root" -p"eliezeribghi" --silent; do
    echo "Waiting for MySQL..."
    sleep 5
done

echo "MySQL is ready!"
php-fpm

