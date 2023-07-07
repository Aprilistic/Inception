#!/bin/sh

# Initialize MariaDB Data Directory if Necessary
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB Server
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB Server to Start
until mysqladmin ping -u root >/dev/null 2>&1; do
    echo -n "."; sleep 1
done

# Run wordpress.sql Script
envsubst < /usr/local/bin/wordpress.sql | mysql -u root 

# Kill the background MariaDB Server
pkill mariadb

# Wait for MariaDB to stop
while pgrep mariadb > /dev/null; do
    echo "Waiting for MariaDB to stop..."
    sleep 1
done

# Run MariaDB Server in foreground
exec "/usr/bin/mysqld_safe"
