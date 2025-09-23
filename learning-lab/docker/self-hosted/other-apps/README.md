# Additional Self-Hosted Apps

| Application | Compose file | Default URL |
|-------------|--------------|-------------|
| Immich | `docker-compose.immich.yml` | http://localhost:2283 |
| Ghost (blog) | `../marketing-automation/docker-compose.ghost.yml` | http://localhost:80812 |
| Plex | `docker-compose.plex.yml` | http://localhost:32400 |
| Mastodon | `docker-compose.mastodon.yml` | http://localhost:80827 |
| BookStack | `docker-compose.bookstack.yml` | http://localhost:80828 |
| Wallabag | `docker-compose.wallabag.yml` | http://localhost:80829 |
| ArchiveBox | `docker-compose.archivebox.yml` | http://localhost:80830 |

Immich and Mastodon require additional configuration (object storage, SMTP) for
production.  The provided compose files use local volumes and simple credentials so you
can explore the UI quickly.

> **Setup hints:** Immich requires GPU drivers for hardware acceleration (optional) while
> Mastodon expects you to copy `.env.production.sample` to `.env.production` and adjust
> secrets.  The provided defaults target a single-node lab deployment.
