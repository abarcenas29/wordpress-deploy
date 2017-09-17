FROM richarvey/nginx-php-fpm

RUN apk update && apk upgrade
RUN apk --no-cache add openrc openssl

ENV COMPOSER_VERSION 1.5.2
RUN apk --no-cache add --update curl && openssl && \
                                curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && \
                                chmod +x /usr/local/bin/composer && \
                                apk del curl openssl && \
                                rm -rf /var/cache/apk/*
COPY /configs/offshorely.local.conf /etc/nginx/sites-enabled/offshorely.local.conf

RUN php-fpm -D

ENV HOME=/app
WORKDIR $HOME
