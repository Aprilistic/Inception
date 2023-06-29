FROM alpine:3.18.2

RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache curl wget bash php php-phar php-json php-curl php-fpm php-mysqli php-iconv

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh
ENTRYPOINT [ "/usr/local/bin/script.sh" ]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm", "-F"]
