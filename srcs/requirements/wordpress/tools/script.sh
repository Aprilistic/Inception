#!/bin/sh

sleep 5
/usr/local/bin/wait-for-it.sh $MARIADB_HOST:$MARIADB_PORT --timeout=15

# check if WordPress is installed
if [ ! -f /var/www/html/wp-config.php ]; then
  # install WordPress
  wp core download --allow-root --path=/var/www/html --force
  wp config create --allow-root --path=/var/www/html --dbhost=$MARIADB_HOST:$MARIADB_PORT --dbname=$MARIADB_DB --dbuser=$MARIADB_USER --dbpass=$MARIADB_PWD --force
  wp db create --allow-root --path=/var/www/html
  wp core install --allow-root --path=/var/www/html --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
  wp user create --path=/var/www/html $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PWD --role=author
  wp theme activate --path=/var/www/html twentytwentytwo
fi

# start php-fpm
/usr/sbin/php-fpm82 --nodaemonize
