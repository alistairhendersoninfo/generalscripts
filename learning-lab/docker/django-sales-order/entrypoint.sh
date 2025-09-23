#!/bin/bash
set -euo pipefail

python manage.py migrate --noinput
python manage.py collectstatic --noinput
exec gunicorn sales_order.wsgi:application --bind 0.0.0.0:8000
