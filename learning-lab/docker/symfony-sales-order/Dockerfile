FROM composer:2 AS vendor
WORKDIR /app
COPY app/composer.json ./
RUN composer install --no-dev --prefer-dist --no-progress --no-interaction
COPY app/ ./
RUN composer install --no-dev --prefer-dist --no-progress --no-interaction

FROM php:8.2-fpm
WORKDIR /var/www/html

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_pgsql

COPY --from=vendor /app /var/www/html
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV APP_ENV=prod \
    APP_DEBUG=0

CMD ["/entrypoint.sh"]
