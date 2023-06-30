#!/bin/bash
set -e

# check if the MariaDB is empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo 'Initializing database'
    /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
    echo 'Database initialized'

    # start the MariaDB server
    /usr/bin/mysqld_safe --nowatch --datadir=/var/lib/mysql

    /usr/bin/mysql -uroot <<-EOSQL
        CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
        GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
        FLUSH PRIVILEGES;
    EOSQL

    # Import the SQL file
    if [ -f /usr/local/bin/init_db.sql ]; then
        echo "Importing init_db.sql file..."
        /usr/bin/mysql -uroot $MYSQL_DATABASE < /usr/local/bin/init_db.sql && echo "SQL file imported successfully."
    else
        echo "File /usr/local/bin/init_db.sql not found. Skipping import."
    fi

    # stop the MariaDB server
    /usr/bin/mysqladmin shutdown
fi

# then you start the server as usual
exec /usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql
