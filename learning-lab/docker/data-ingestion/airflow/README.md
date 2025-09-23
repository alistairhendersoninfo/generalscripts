# Apache Airflow DAG

A single-container Airflow environment that executes a PythonOperator to parse the Apache HTTP
access log sample and load it into ClickHouse.

```bash
docker compose -f docker-compose.airflow.yml up -d
```

The web UI is available on `http://localhost:8082` with credentials `admin/admin`.  Trigger the
`worldbank_to_clickhouse` DAG manually after ensuring the dataset archive has been downloaded.
