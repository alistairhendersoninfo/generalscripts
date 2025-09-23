# Laravel sales order mini-application

This folder contains container assets and documentation to bootstrap a Laravel 10 application
that mimics a simple sales order entry workflow backed by PostgreSQL and styled with Tailwind
CSS.  The repository does not ship the generated Laravel sources to keep the footprint small;
run the scaffolding commands described below to create the application and then rebuild the
containers.

## Stack

* PHP 8.3 FPM with pdo_pgsql, intl, mbstring and zip extensions
* Node.js 20 for Vite/Tailwind asset compilation
* nginx reverse proxy (defined in `nginx/default.conf`)
* PostgreSQL 16 (provided by the core compose stack)

## Bootstrapping the application

```bash
# inside learning-lab/docker/laravel-sales-order
composer create-project laravel/laravel src
cd src
composer require laravel/breeze livewire/livewire spatie/laravel-query-builder spatie/laravel-data
php artisan breeze:install blade --ssr
npm install
```

Suggested domain model:

| Table | Purpose |
|-------|---------|
| `customers` | Customer master data (name, email, segment) |
| `skus` | Product catalogue (SKU code, description, unit price) |
| `delivery_addresses` | Multiple shipping addresses per customer |
| `sales_orders` | Order header (customer, address, status, totals) |
| `sales_order_lines` | Order lines referencing SKU, quantity and unit price |

Create Eloquent models and migrations for the above schema, then seed them with data generated
via `python/generators/order_generator.py`.

Expose CRUD routes for customers/SKUs/addresses using Livewire components or standard
controllers.  The order entry screen should allow selecting a customer, choosing an address,
adding SKU lines, previewing totals and submitting the order.  Include API endpoints under
`/api/v1/` returning JSON for customers, SKUs and aggregated sales totals (consumed by the chart
examples and the React/Vue demos).

After building the features run migrations and compile assets:

```bash
php artisan migrate --seed
npm run dev # or npm run build
```

Update the `.env` file to point to the shared Postgres container:

```
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=sales
DB_USERNAME=laravel
DB_PASSWORD=laravel
```

## Docker Compose usage

`docker-compose.yml` wires php-fpm, nginx and a scheduler/queue worker container:

```bash
docker compose up -d --build
```

Once the containers are running the application will be available through the master nginx
proxy at `http://localhost:8080/laravel/`.

See the inline comments inside `docker-compose.yml` for environment variables and volume
mounts.  The compose file also includes a one-shot `artisan` service to execute commands such as
migrations (`docker compose run --rm artisan migrate`).
