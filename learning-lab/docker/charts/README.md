# Charting gallery

This compose stack renders the same GDP per capita dataset with eleven different JavaScript
charting libraries.  The static assets are fronted by the shared master nginx proxy while a
FastAPI backend surfaces ClickHouse queries through `/api/*` endpoints.

## Prerequisites

* Core services running (`docker/core/docker-compose.core.yml`) so ClickHouse and the master
  nginx proxy are available.
* Datasets loaded into ClickHouse (see Airbyte/Hop/Airflow instructions or run the helper SQL
  statements in `sql/bootstrap_clickhouse.sql`).

## Usage

```bash
# from learning-lab/docker/charts
docker compose -f docker-compose.charts.yml up -d --build
```

Navigate to `http://localhost:8080/` and follow the links to each library.  Data is requested
from `/api/worldbank/...` endpoints which the master proxy forwards to the FastAPI backend.

Each app is built as a tiny nginx image serving a single HTML file that pulls the library from
public CDNs, making the containers lightweight and easy to inspect.
