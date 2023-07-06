FROM alpine:3.18.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache curl php82 php82-fpm php82-mysqli dumb-init netcat-openbsd && \
    ln -s /usr/bin/php82 /usr/bin/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN addgroup -g 82 -S www-data; exit 0  # This command will not fail if the group already exists
RUN adduser -u 82 -D -S -G www-data www-data

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf
RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh       

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/script.sh" ]
