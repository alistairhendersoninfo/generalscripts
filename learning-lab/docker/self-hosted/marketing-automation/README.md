# Marketing Automation & Analytics

This folder collects marketing automation suites, newsletter tools, and privacy-friendly
analytics dashboards.  Each compose file is self-contained with the datastore required by
the application.

| Application | Compose file | Default URL |
|-------------|--------------|-------------|
| Mautic | `docker-compose.mautic.yml` | http://localhost:80810 |
| Matomo | `docker-compose.matomo.yml` | http://localhost:80811 |
| Ghost (content marketing) | `docker-compose.ghost.yml` | http://localhost:80812 |
| Strapi | `docker-compose.strapi.yml` | http://localhost:1337 |
| Agnitas OpenEMM | `docker-compose.agnitas.yml` | http://localhost:80813 |
| Mailtrain | `docker-compose.mailtrain.yml` | http://localhost:80814 |
| Listmonk | `docker-compose.listmonk.yml` | http://localhost:9001 |
| n8n | `docker-compose.n8n.yml` | http://localhost:5678 |
| Activepieces | `docker-compose.activepieces.yml` | http://localhost:80815 |
| Umami | `docker-compose.umami.yml` | http://localhost:80816 |
| Plausible Analytics | `docker-compose.plausible.yml` | http://localhost:80817 |
| GoatCounter | `docker-compose.goatcounter.yml` | http://localhost:80818 |
| OpenEMM | `docker-compose.openemm.yml` | http://localhost:80819 |

> Port numbers in this section are intentionally high to minimise clashes.  Adjust them as
> needed when running multiple stacks simultaneously.
