# Self-Hosted Application Gallery

This section adds Docker Compose blueprints for popular open source collaboration,
communication, project management, marketing, automation, and personal productivity
platforms.  Each application is packaged as a small, focused compose file so that you
can start a single product in isolation or mix and match them with the shared
infrastructure provided by `docker/core/docker-compose.core.yml`.

The gallery is organised by functional area:

- `workspace-collaboration/` – productivity suites and groupware.
- `communication/` – chat, messaging, VoIP, and mail servers.
- `project-management/` – agile boards and project planning.
- `file-sharing/` – sync and share solutions.
- `marketing-automation/` – marketing platforms, analytics, and campaign tools.
- `dev-automation/` – developer portals, automation servers, and git hosts.
- `password-management/` – team password vaults.
- `other-apps/` – additional self-hosted favourites that do not fit the above groups.

Each subdirectory includes:

1. A `README.md` with prerequisites, launch instructions, credentials, and validation tips.
2. One Docker Compose file per application (named `docker-compose.<app>.yml`).
3. Optional helper files (Dockerfiles, configuration templates, or environment samples)
   when an image needs additional bootstrap steps.

The compose files rely exclusively on upstream community or vendor-maintained container
images.  For products that require multiple backing services (databases, caches, message
queues), the compose bundle includes opinionated defaults so you can get started quickly.
Adjust credentials, volumes, and exposed ports as needed for your environment.

> **Security reminder:** The provided passwords and secrets are demo values.  Replace them
> before exposing any service beyond a local lab.  Many of the containers require domain
> names, SMTP relays, or TLS certificates for production use—refer to the upstream
> documentation linked in each README.

## Usage pattern

1. Start shared infrastructure as needed (PostgreSQL, Redis, ClickHouse, etc.).
2. Change directory into the desired subfolder.
3. Copy the sample environment file if provided, adjust values, and run the compose command
   indicated in the README.
4. Access the web UI or API endpoints through the ports noted in the documentation.

Because these examples are designed for education, resource footprints are kept modest.
Feel free to tailor CPU/memory limits or storage allocations to suit your hardware.
