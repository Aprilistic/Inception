FROM alpine:3.18.2

RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml wget

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp && \
    wp core download --path=/var/www/wordpress --allow-root

COPY conf/wp-config.php /var/www/wordpress/wp-config.php
COPY tools/create_wordpress.sh /tmp/create_wordpress.sh

WORKDIR /var/www/wordpress

RUN chmod +x /tmp/create_wordpress.sh
ENTRYPOINT [ "/tmp/create_wordpress.sh" ]

EXPOSE 9000

CMD ["php-fpm", "-F"]
