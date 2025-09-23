# Core shared services

This compose file provisions the shared infrastructure that multiple demos rely on:

* PostgreSQL 16 (database for the Laravel app)
* ClickHouse 23.8 (analytical store consumed by chart demos, ETL exercises and language tooling)
* MinIO (S3-compatible object storage for orchestrators)
* Redis 7 (cache/queue)
* Master nginx reverse proxy

Bring the stack up before launching dependent compose files:

```bash
docker compose -f docker-compose.core.yml up -d
```

The nginx container expects downstream services to register additional upstreams via docker
DNS.  Update `../charts/master-nginx/conf.d/master.conf` if you customise hostnames or ports.
