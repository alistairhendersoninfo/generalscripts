# Apache Hop pipeline

The Hop web UI container mounts the `pipelines/` directory where the sample pipeline
`worldbank_to_clickhouse.hpl` lives.  The pipeline demonstrates reading the downloaded CSVs
and loading the data into ClickHouse via JDBC.

```bash
docker compose -f docker-compose.hop.yml up -d
```

Open `http://localhost:8081/hop` with credentials `admin/admin`, import the pipeline and update
the parameter `INPUT_FILE` to match the CSV produced by the World Bank download script.
