FROM alpine:3.18.2

WORKDIR /mariadb

RUN apk update && apk upgrade --no-cache && \
    apk add mariadb mariadb-client mariadb-common mariadb-server mariadb-server-utils wget --no-cache \
    wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysqld

VOLUME [ "/var/lib/mysql" ]

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/wordpress.sql

EXPOSE 3306
ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/docker-entrypoint.sh" ]

CMD [ "mysqld" ]
