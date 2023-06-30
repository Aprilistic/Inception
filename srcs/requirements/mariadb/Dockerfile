FROM alpine:3.18.2

WORKDIR /mariadb

RUN apk update && apk upgrade --no-cache && \
    apk add mariadb mariadb-client mariadb-common mariadb-server-utils --no-cache

VOLUME [ "/var/lib/mysql" ]

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 3306
CMD [ "mysqld", "--user=mysql", "--datadir=/var/lib/mysql" ]
