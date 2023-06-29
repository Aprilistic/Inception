FROM alpine:3.18.2

RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache curl mariadb-client redis php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp && \
    wp core download --path=/var/www/wordpress --allow-root

RUN find / -name www.conf

RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh
ENTRYPOINT [ "/usr/local/bin/script.sh" ]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm7", "-F"]
