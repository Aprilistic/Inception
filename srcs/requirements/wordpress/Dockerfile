FROM alpine:3.18.2
WORKDIR /wordpress
RUN apk update && apk upgrade --no-cache

RUN apk add php7 \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-zlib \
    php7-xml \
    php7-phar \
    php7-intl \
    php7-dom \
    php7-xmlreader \
    php7-ctype \
    php7-mbstring \
    php7-gd \
    curl \
    --no-cache

RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && rm latest.tar.gz \
    && mv wordpress /var/www/localhost/htdocs/wordpress

COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7", "-F"]