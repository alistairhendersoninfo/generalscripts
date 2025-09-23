FROM php:8.2-apache
RUN apt-get update && apt-get install -y --no-install-recommends git unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
RUN git clone https://github.com/jan-vandenberg/cruddiy.git .
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80
