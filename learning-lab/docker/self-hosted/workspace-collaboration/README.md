# Workspace & Collaboration Suites

Launch collaborative suites, office portals, and groupware stacks with the compose bundles
in this folder.  Each file exposes a single product plus its primary dependencies.  All
containers mount named volumes for persistence so data survives restarts.

| Application | Compose file | Default URL | Notes |
|-------------|--------------|-------------|-------|
| Nextcloud | `docker-compose.nextcloud.yml` | http://localhost:8081 | Includes PostgreSQL and Redis for reliability. |
| OnlyOffice Docs | `docker-compose.onlyoffice.yml` | https://localhost:8443 | Document Server behind nginx with self-signed cert (see README for trusting). |
| Zimbra Collaboration Suite | `docker-compose.zimbra.yml` | https://localhost:9081 | Requires DNS overrides for `mail.local`; demo values provided. |
| Kopano Groupware | `docker-compose.kopano.yml` | https://localhost:9443 | WebApp served behind Traefik-style nginx proxy. |
| CryptPad | `docker-compose.cryptpad.yml` | https://localhost:3001 | Uses official `cryptpad/cryptpad` image with local object storage. |
| SOGo Groupware | `docker-compose.sogo.yml` | http://localhost:20000/SOGo | Integrates memcached and PostgreSQL. |
| eXo Platform | `docker-compose.exo.yml` | http://localhost:8082 | Runs the community edition with PostgreSQL backend. |
| Cyn.in | `docker-compose.cynin.yml` | http://localhost:8083 | Builds from source using Plone base image for archival evaluation. |
| EGroupware | `docker-compose.egroupware.yml` | http://localhost:8084 | Connects to bundled MariaDB for groupware data. |

## Getting started

1. Review the compose file for the application you want to explore.
2. If an `.env.example` file is present, copy it to `.env` and adjust secrets.
3. Run `docker compose -f docker-compose.<app>.yml up -d`.
4. Wait for the service health checks to report `healthy` (use `docker compose ps`).
5. Browse to the URL listed above and follow any on-screen bootstrap wizards.

### DNS and SSL considerations

Some suites (Zimbra, OnlyOffice, Kopano) assume access through a fully qualified domain
name with valid SSL certificates.  For local labs you can:

- Map the demo domain to `127.0.0.1` in `/etc/hosts` (examples use `*.lab.local`).
- Trust the generated self-signed certificate or replace it with one issued via mkcert/Let’s Encrypt.

Refer to vendor documentation for production-grade hardening.

### Mail relays and SMTP

Mail-centric platforms (Zimbra, SOGo, EGroupware) ship with placeholder SMTP settings that
work for local delivery only.  Point the relevant environment variables at your relay server
when you need outbound email capability.
