FROM composer:2 AS vendor
WORKDIR /app
COPY composer.json ./
RUN composer install --no-dev --prefer-dist --no-progress --no-interaction

FROM php:8.2-apache
RUN docker-php-ext-install pdo_sqlite
WORKDIR /var/www/html
COPY --from=vendor /app/vendor ./vendor
COPY public/ ./
COPY data/ /var/www/html/data/

EXPOSE 80
