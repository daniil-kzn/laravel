FROM php:7.3.8-fpm

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    git
RUN docker-php-ext-install pdo pdo_mysql mbstring zip

WORKDIR /var/www/laravel

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
