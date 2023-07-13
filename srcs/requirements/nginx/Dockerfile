FROM alpine:3.18.2

WORKDIR /nginx
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache nginx openssl dumb-init

# generate ssl certificate
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jinheo/CN=jinheo" \
    -keyout /etc/nginx/ssl/jinheo.key -out /etc/nginx/ssl/jinheo.crt

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD ["nginx", "-g", "daemon off;"]
