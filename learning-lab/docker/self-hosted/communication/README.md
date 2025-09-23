# Communication Platforms

Spin up chat, voice, and mail collaboration stacks.  Each compose file focuses on a single
application and brings along the databases or supporting daemons it needs for a local lab.

| Application | Compose file | Default endpoint |
|-------------|--------------|------------------|
| Zulip | `docker-compose.zulip.yml` | https://zulip.localhost | 
| Mattermost | `docker-compose.mattermost.yml` | http://localhost:8065 |
| Rocket.Chat | `docker-compose.rocketchat.yml` | http://localhost:3000 |
| Matrix Synapse + Element | `docker-compose.element.yml` | Element at http://localhost:8085 |
| Jami daemon | `docker-compose.jami.yml` | SIP gateway on port 5060 |
| GNUnet | `docker-compose.gnunet.yml` | REST API on http://localhost:7776 |
| Mumble | `docker-compose.mumble.yml` | Voice server on localhost:64738 |
| Jitsi Meet | `docker-compose.jitsi.yml` | https://meet.localhost |
| Wire Server | `docker-compose.wire.yml` | https://wire.localhost |
| Conduit (Matrix homeserver) | `docker-compose.conduit.yml` | http://localhost:6167 |
| Poste.io | `docker-compose.posteio.yml` | https://mail.localhost |
| Mailcow | `docker-compose.mailcow.yml` | https://mailcow.localhost |
| Mailu | `docker-compose.mailu.yml` | https://mailu.localhost |

## Launch steps

1. Review the compose file for prerequisites (DNS entries, TLS certificates, SMTP relays).
2. Export any secrets referenced by the compose file or copy provided `.env.example` files.
3. Bring the stack online: `docker compose -f docker-compose.<app>.yml up -d`.
4. Inspect logs for boot progress (`docker compose logs -f <service>`).
5. Access the web UI or connect via the documented client.

Mail solutions (Poste.io, Mailcow, Mailu) expect valid MX records and PTRs for full
functionality.  For lab mode you can rely on `/etc/hosts` entries and disable outbound
spam checks.  Consult the official documentation before opening them to the internet.

> **Tip:** The Jitsi, Mailcow, and Mailu bundles include `.env.example` files.  Copy them to
> `.env` in the same directory and adjust secrets before starting the stack.
