# PHP-CRUD-API sample

Starts the [`php-crud-api`](https://github.com/mevdschee/php-crud-api) microservice backed by a SQLite dataset. The container creates a sample `customers` table on first boot so you can query `/records/customers` immediately.

## Run
```bash
docker compose -f docker-compose.php-crud-api.yml up --build
```
Use http://localhost:8123/records/customers to fetch rows.
