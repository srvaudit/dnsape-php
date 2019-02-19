FROM php:7.3.1-fpm-alpine

# install dependencies
RUN apk update && apk add --no-cache curl-dev git nodejs-current-npm icu-dev iputils bind-tools vim && rm -rf /var/cache/apk/*
RUN docker-php-ext-install intl
RUN cd /usr/local/etc/php && mv php.ini-development php.ini

# add code
RUN git clone https://github.com/srvaudit/dnsape.git /var/www/dnsape

# laravel setup
RUN chown -R www-data:www-data /var/www/dnsape/storage
RUN chmod -R gu+w /var/www/dnsape/storage
RUN chmod -R gu+w /var/www/dnsape/bootstrap/cache
