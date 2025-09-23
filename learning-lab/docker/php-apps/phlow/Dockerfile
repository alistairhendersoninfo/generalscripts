FROM composer:2 AS vendor
WORKDIR /app
COPY composer.json ./
RUN composer install --no-dev --prefer-dist --no-progress --no-interaction

FROM php:8.2-apache
WORKDIR /var/www/html
COPY --from=vendor /app/vendor ./vendor
COPY --from=vendor /app/composer.json ./
COPY public/ ./

EXPOSE 80
