FROM alpine:latest
WORKDIR /nginx
RUN apk update && apk upgrade --no-cache
RUN apk add nginx
RUN apk add openssh

RUN rc-service nginx start
RUN rc-update add nginx default