# Development & Automation Platforms

This directory provides dockerised low-code builders, automation orchestrators, and git
hosting solutions.

| Application | Compose file | Default URL |
|-------------|--------------|-------------|
| Appsmith | `docker-compose.appsmith.yml` | http://localhost:80820 |
| ToolJet | `docker-compose.tooljet.yml` | http://localhost:80821 |
| Budibase | `docker-compose.budibase.yml` | http://localhost:80822 |
| Gogs | `docker-compose.gogs.yml` | http://localhost:3001 |
| GitLab CE | `docker-compose.gitlab.yml` | http://localhost:8929 |
| Huginn | `docker-compose.huginn.yml` | http://localhost:80823 |
| StackStorm | `docker-compose.stackstorm.yml` | https://localhost:8449 |
| Apache Airflow | `docker-compose.airflow.yml` | http://localhost:80824 |

Refer to each project's upstream documentation for domain-specific configuration such as
SMTP relays or OAuth providers.
