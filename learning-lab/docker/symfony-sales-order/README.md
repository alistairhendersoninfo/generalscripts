# Symfony sales order workspace

A Symfony 7 build of the sales order entry workflow with Doctrine ORM, Twig templates styled by Tailwind, and an nginx + PHP-FPM front end.

## Highlights
- Doctrine entities and migrations for customers, delivery addresses, SKUs, and order/line tables aligned with the Laravel and Django examples.
- Form-based CRUD screens using Symfony Forms, Twig, and Tailwind.
- PHP-FPM container runs migrations on startup and serves traffic behind Nginx.
- Shares the same PostgreSQL schema so you can reuse the demo data generators.

## Usage
1. Bring up the shared lab core if needed:
   ```bash
   docker compose -f ../core/docker-compose.core.yml up -d
   ```
2. Build and start the Symfony stack:
   ```bash
   docker compose up --build
   ```
3. Access http://localhost:8083 for the dashboard and order entry screens.
4. To run console commands, exec into the PHP container:
   ```bash
   docker compose exec php php bin/console doctrine:schema:validate
   ```

The container installs Composer dependencies at build time and migrates the database automatically on startup so the UI is ready to use immediately.
