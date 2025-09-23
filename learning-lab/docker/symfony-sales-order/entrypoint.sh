#!/bin/bash
set -euo pipefail

php bin/console doctrine:migrations:migrate --no-interaction
php-fpm
