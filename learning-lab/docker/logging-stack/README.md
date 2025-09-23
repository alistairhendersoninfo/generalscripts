# Logging stack

A Grafana Loki deployment with Promtail scraping nginx access logs and dataset files.  Grafana
ships with the ClickHouse plugin to correlate logs and metrics across stacks.

```bash
docker compose -f docker-compose.logging.yml up -d
```

Once running, Grafana is available on `http://localhost:3000` (default credentials `admin/admin`).
Add the Loki data source pointing to `http://loki:3100` and start exploring log streams labelled
`job="nginx"` or `job="cicids"`.
