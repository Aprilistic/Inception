# Inception

## Learn how to use Docker.
This tiny project aims to set up a local WordPress backend server in Docker environment. 

### Nginx
Uses self-created TSL(SSL) certificate. This server can be accessed using port:443 only(HTTPS). 

### MariaDB
This container can be accessed on port:3306 only.
Sets account for WordPress to set its own database.

### WordPress
Installs required files and configures using WP-CLI. Pages are run by PHP-FPM.

## Dockerfile
Build docker images from Alpine. Nginx, WordPress, MariaDB.
Every container uses dumb-init to avoid unexpected errors related to PID==1.

## Docker Compose
Set local network and bind mount volumes for WordPress, MariaDB containers.


## How to run?
1. Clone this repo (tested on Ubuntu only)
2. Go to the root directory.
3. Type 'make up' command.
4. Wait for seconds for initialization. (Takes around 20 seconds)
5. Access "jinheo.42.fr" on the browser.
6. Yes, you may see the blog. Account infos are written in srcs/.env file.
7. Type 'make down' to stop server, 'make clean' to clean everything.
