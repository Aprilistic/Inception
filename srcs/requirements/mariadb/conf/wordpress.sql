-- Check if the user already exists. If not, create a new one.
DROP USER IF EXISTS '$MARIADB_USER'@'%';
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';

-- Check if the database exists. If not, create a new one.
-- DROP DATABASE IF EXISTS $MARIADB_DB;
-- CREATE DATABASE $MARIADB_DB;

-- Assign all privileges on the WordPress database to the WordPress user.
GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;
-- Make the changes take effect immediately.
FLUSH PRIVILEGES;
