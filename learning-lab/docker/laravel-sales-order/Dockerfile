FROM php:8.3-fpm-alpine as base

RUN apk add --no-cache bash git curl zip unzip icu-dev oniguruma-dev libzip-dev postgresql-dev \
    && docker-php-ext-install intl mbstring pdo_pgsql zip

WORKDIR /var/www/html

FROM base as vendor
COPY src/composer.json src/composer.lock ./
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php \
    && composer install --no-dev --optimize-autoloader
COPY src ./

FROM node:20-alpine as assets
WORKDIR /app
COPY src/package*.json ./
RUN npm ci
COPY src ./
RUN npm run build

FROM base
COPY --from=vendor /var/www/html /var/www/html
COPY --from=assets /app/public/build /var/www/html/public/build
COPY docker/php.ini /usr/local/etc/php/conf.d/custom.ini
RUN chown -R www-data:www-data storage bootstrap/cache
CMD ["php-fpm"]
