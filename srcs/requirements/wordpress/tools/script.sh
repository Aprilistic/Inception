#!/bin/sh

# www.conf
if [ $? -eq 0 ]; then
  # Change the Listening Host with 9000 Port
	CONF_DIR = find / -name www.conf
  sed -i "s/.*listen = 127.0.0.1.*/listen = 9000/g" $CONF_DIR
  # Append Env Variables on the Configuration File
  echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> $CONF_DIR
  echo "env[MARIADB_USER] = \$MARIADB_USER" >> $CONF_DIR
  echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> $CONF_DIR
  echo "env[MARIADB_DB] = \$MARIADB_DB" >> $CONF_DIR
fi


# wp-config.php 
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
