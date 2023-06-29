FROM alpine:3.18
WORKDIR /nginx
RUN apk update && apk upgrade --no-cache

RUN apk add mariadb mariadb-client --no-cache

COPY my.cnf /etc/mysql/my.cnf
COPY wordpress.sql /tmp/wordpress.sql