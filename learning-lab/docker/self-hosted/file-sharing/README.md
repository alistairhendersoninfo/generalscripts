# File Storage and Sharing

Use these compose bundles to experiment with self-hosted file sync platforms.  The
Nextcloud compose file is shared with the workspace collection to avoid duplication.

| Application | Compose file | Default URL |
|-------------|--------------|-------------|
| Nextcloud | `../workspace-collaboration/docker-compose.nextcloud.yml` | http://localhost:8081 |
| ownCloud | `docker-compose.owncloud.yml` | http://localhost:8089 |
| Seafile | `docker-compose.seafile.yml` | http://localhost:8090 |

All stacks rely on PostgreSQL or MariaDB to persist metadata and mount named volumes for
user files.
