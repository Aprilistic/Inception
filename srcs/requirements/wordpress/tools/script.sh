#!/bin/sh

# wait for MariaDB
until nc -z -v -w30 mariadb 3306
do
  echo "Waiting for database connection..."
  # wait for 5 seconds before check again
  sleep 5
done

# wp-config.php 
if [ -f ./wp-config.php ]; then
		echo "WordPress already installed"
else
		wget https://wordpress.org/latest.tar.gz
		tar -xvf latest.tar.gz
		rm -rf latest.tar.gz
		mv wordpress/* .
		rm -rf wordpress

		sed -i "s/database_name_here/$MARIADB_DB/g" wp-config-sample.php
		sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
		sed -i "s/password_here/$MARIADB_PWD/g" wp-config-sample.php
		sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php
		cp wp-config-sample.php wp-config.php

		echo "WordPress installed"
fi

# apk -L info php82-fpm

/usr/sbin/php-fpm82 --nodaemonize
