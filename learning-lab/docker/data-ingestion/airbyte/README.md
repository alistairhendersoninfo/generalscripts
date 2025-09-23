# Airbyte quickstart

Launch the official Airbyte open-source distribution with a minimal Postgres backing store.

```bash
docker compose -f docker-compose.airbyte.yml up -d
```

Once the UI is reachable at `http://localhost:8000`, import the sample connection definition in
`config/worldbank-clickhouse.json` via the API or UI.  The configuration pulls the World Bank GDP
per capita indicator for the USA and writes into the ClickHouse table
`analytics.worldbank_gdp_per_capita`.
