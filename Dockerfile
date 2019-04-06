FROM php:7.3.1-fpm

# install dependencies
RUN apt-get update && \
    apt-get install -y libicu-dev git vim iputils-ping procps sudo dnsutils && \
    rm -r /var/lib/apt/lists/* 
RUN docker-php-ext-install intl
RUN cd /usr/local/etc/php && mv php.ini-development php.ini

# add code
RUN git clone https://github.com/srvaudit/dnsape.git /var/www/dnsape

# laravel setup
RUN chown -R www-data:www-data /var/www/dnsape/storage
RUN chmod -R gu+w /var/www/dnsape/storage
RUN chmod -R gu+w /var/www/dnsape/bootstrap/cache
