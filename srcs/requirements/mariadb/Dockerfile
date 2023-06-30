FROM alpine:3.18.2

WORKDIR /mariadb

RUN apk update && apk upgrade --no-cache && \
    apk add mariadb mariadb-client mariadb-common mariadb-server-utils wget --no-cache \
    wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init

VOLUME [ "/var/lib/mysql" ]

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306
ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "mysqld", "--user=mysql", "--datadir=/var/lib/mysql" ]
