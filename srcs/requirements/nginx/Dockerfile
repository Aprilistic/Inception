FROM alpine:3.18.2
WORKDIR /nginx
RUN apk update && apk upgrade --no-cache
RUN apk add nginx
RUN apk add openssh

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]