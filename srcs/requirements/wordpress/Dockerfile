FROM alpine:3.18.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache curl wget php82 php82-fpm

RUN ln -s /usr/bin/php82 /usr/bin/php

RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /var/www/html/
RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh       

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/script.sh" ]
