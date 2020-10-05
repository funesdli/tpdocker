FROM alpine:3.12

RUN apk update && \
    apk add apache2 && \
    apk add php7 php7-apache2 php7-mysqli && \

    rm -rf /var/cache/apk/*

VOLUME /test/web

EXPOSE 80 443

CMD ["usr/sbin/httpd","-D","FOREGROUND"]
