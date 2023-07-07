FROM alpine:3.18.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache curl bash mysql-client php82 php82-fpm php82-iconv php82-mysqli php82-phar dumb-init && \
    ln -s /usr/bin/php82 /usr/bin/php

RUN curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp && \
    curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/local/bin/wait-for-it.sh && \
    chmod +x /usr/local/bin/wait-for-it.sh

RUN addgroup -g 82 -S www-data; exit 0  # This command will not fail if the group already exists
RUN adduser -u 82 -D -S -G www-data www-data

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf
RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh && \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/script.sh" ]
