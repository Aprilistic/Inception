FROM alpine:3.18.2

# WORKDIR /mariadb

RUN apk update && \
    apk upgrade --no-cache && \
    apk add mariadb mariadb-client mariadb-server-utils gettext dumb-init --no-cache && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
    chmod -R 755 /var/lib/mysql /run/mysqld

COPY ./tools/script.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
COPY ./conf/my.cnf /etc/my.cnf
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 3306
ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/script.sh" ]
