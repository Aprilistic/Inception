#!/bin/sh

if [ -f ./wp-config.php ]; then
		echo "WordPress already installed"
else
		wget https://wordpress.org/latest.tar.gz
		tar -xvf latest.tar.gz
		rm -rf latest.tar.gz
		mv wordpress/* .
		rm -rf wordpress

		sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
		sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
		sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
		sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
		cp wp-config-sample.php wp-config.php

		echo "WordPress installed"
fi
