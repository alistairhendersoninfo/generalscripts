# Data ingestion and orchestration

This folder groups three orchestration engines (Airbyte, Apache Hop and Apache Airflow) that
all load subsets of the downloaded datasets into ClickHouse.

* `airbyte/` – UI-driven replication of the World Bank GDP indicator.
* `apache-hop/` – pipeline definition that reads CSV exports and writes to ClickHouse via JDBC.
* `airflow/` – DAG parsing the Apache HTTP log sample and inserting rows into ClickHouse.

Spin up each stack independently depending on the workflow you wish to explore.
