FROM php:7.3.8-fpm

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    git

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo pdo_mysql mbstring zip
ADD ./docker/php.ini /usr/local/etc/php/php.ini
WORKDIR /var/www/laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
