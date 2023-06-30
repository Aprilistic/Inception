FROM alpine:3.18.2

RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache curl wget bash php php-phar php-json php-curl php-fpm php-mysqli php-iconv \
    wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/script.sh
COPY ./conf/init_db.sql /usr/local/bin/init_db.sql

RUN chmod +x /usr/local/bin/script.sh       
ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/script.sh" ]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm", "-F"]
