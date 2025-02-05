#!/bin/bash

sleep 10

if [ ! -f "/var/www/html/wp-config.php" ]
then
    echo "Téléchargement de WordPress..."
    wp core download --path="/var/www/html" --allow-root
    
    echo "Création du fichier wp-config.php..."
    wp config create --path="/var/www/html" --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --skip-check
    
    echo "Installation de WordPress..."
    wp core install --path="/var/www/html" --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email
    
    echo "Création de l'utilisateur supplémentaire..."
    wp user create "$WP_USER" "$WP_EMAIL" --role=subscriber --user_pass="$WP_PASS" --allow-root --path=/var/www/html
    
else
    echo "WordPress est déjà installé."
fi

exec /usr/sbin/php-fpm7.4 -F

