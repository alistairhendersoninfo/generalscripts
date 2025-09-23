# Django sales order workspace

This stack mirrors the Laravel sales order sample with Django 5, PostgreSQL, and Tailwind-powered templates rendered behind Nginx.

## Features
- Customer, delivery address, SKU, and order management screens backed by PostgreSQL models.
- Inline formsets for adding and editing order line items with live totals.
- Tailwind CSS styling (served via CDN) and message flash notifications.
- Gunicorn + Nginx front-end mirroring the production-style layout used in the Laravel example.

## Usage
1. Start the shared core services if you have not already:
   ```bash
   docker compose -f ../core/docker-compose.core.yml up -d
   ```
2. Launch the Django stack:
   ```bash
   docker compose up --build
   ```
3. Visit http://localhost:8082 to access the dashboard.
4. Run migrations or create a superuser interactively when needed:
   ```bash
   docker compose run --rm web python manage.py createsuperuser
   ```

Static assets are exported to the `static-data` volume and mounted into the Nginx container. The database connection parameters mirror the Laravel stack, so both applications can target the same customer/order dataset if desired.
