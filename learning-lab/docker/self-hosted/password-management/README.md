# Password Management Vaults

| Application | Compose file | Default URL |
|-------------|--------------|-------------|
| Bitwarden (vaultwarden) | `docker-compose.bitwarden.yml` | http://localhost:80825 |
| Passbolt | `docker-compose.passbolt.yml` | https://localhost:80826 |

Vaultwarden runs over HTTP by default; enable HTTPS by placing it behind the master nginx
proxy or configuring a reverse proxy of your choice.  Passbolt ships with a lightweight
nginx + self-signed TLS setup for convenience.

> **Setup:** Copy `passbolt/.env.example` to `passbolt/.env` and tweak the values before launching Passbolt.
