# Project Management Stacks

These compose files deploy kanban boards and agile project trackers.  Each stack comes
pre-wired with the database it needs and exposes the default web port on localhost.

| Application | Compose file | Default URL |
|-------------|--------------|-------------|
| Focalboard | `docker-compose.focalboard.yml` | http://localhost:8055 |
| OpenProject | `docker-compose.openproject.yml` | http://localhost:8087 |
| Taiga | `docker-compose.taiga.yml` | http://localhost:9000 |
| Kanboard | `docker-compose.kanboard.yml` | http://localhost:8080 |

All admin passwords default to `Admin123!` for quick evaluation.  Change them before
use in shared environments.
