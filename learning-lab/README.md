# Learning Lab Infrastructure Overview

This workspace packages a catalogue of containerised examples that can be used to explore
application development, data ingestion, analytics visualisation, workflow orchestration
and high-availability patterns.  Every stack is described by a dedicated Docker Compose
file (with matching Dockerfiles and configuration) and is mirrored by infrastructure as
code manifests for Helm (Kubernetes) and Nomad where applicable.  The goal is to provide
repeatable blueprints rather than a single monolithic environment so that each scenario
can be started independently when needed.

## Repository Structure

```
learning-lab/
├── README.md                      # This guide
├── datasets/                      # Scripts and docker image for downloading public datasets
├── docker/
│   ├── laravel-sales-order/       # Laravel + Tailwind sales order demo
│   ├── charts/                    # Eleven charting demos (Chart.js, D3.js, ...)
│   ├── data-ingestion/            # Airbyte, Apache Hop and Airflow examples
│   ├── logging-stack/             # Promtail + Loki + Grafana quickstart
│   ├── lang/                      # LangFlow, LangChain and LangGraph services
│   ├── keepalived/                # MySQL pair with keepalived virtual IP
│   ├── zookeeper-kafka/           # 3-node ZooKeeper ensemble with Kafka sample workload
│   ├── react-vue/                 # React and Vue showcase containers (served by nginx)
│   └── static-site/               # Hydro static site demo (Astro powered)
├── helm/                          # Helm umbrella charts mirroring the compose files
└── nomad/                         # Nomad job specifications mirroring the compose files
```

Each folder contains a `README.md` explaining:

* prerequisite tools
* how to build and start the containers
* configuration that should be tweaked (passwords, network ports, dataset locations, etc.)
* how to exercise the example once it is running

> **Note:** The supplied images favour reproducibility and clarity over deep optimisation.
> Where possible all base images are stable LTS variants (Ubuntu 22.04, Debian 12, Alpine 3.19
> or official vendor releases).  For production-readiness review security guidance, resource
> quotas and secrets management policies for your organisation.

## Data sources

The lab downloads the following open datasets (using the `datasets` docker image):

* [World Bank Data API](https://data.worldbank.org/) – used by the charting demos and the ETL
  workflows to populate ClickHouse analytical tables.
* Apache HTTP access log sample – via Elastic's examples repository.
* CIC-IDS2017 labelled network flow dataset – used in ETL exercises.
* Wireshark packet captures – single HTTP capture provided for convenience.

The `datasets/download.sh` script performs the download locally while the
`docker/datasets-downloader` container runs the same script inside a tiny image to keep
runtime environments deterministic.

## Base services

To avoid repeating common infrastructure components, the `docker-compose.core.yml` file
(definition in `docker/core/docker-compose.core.yml`) provides shared services that other
examples can link against:

* `postgres` – backing store for the Laravel demo.
* `clickhouse` – analytical store for charting dashboards and ETL pipelines.
* `minio` – S3-compatible object storage used by some orchestrators (Airbyte, Airflow)
  to persist artefacts.
* `nginx-master` – front proxy that routes requests to the per-example nginx frontends
  (chart demos, React/Vue showcase, static site) so they can share a single public entry point.
* `redis` – queue/cache service used by Laravel Horizon jobs and by LangChain demos.

Bring this stack up first when experimenting with the dependent environments:

```bash
docker compose -f docker/core/docker-compose.core.yml up -d
```

The remainder of this document summarises what is available in each subdirectory and where
to look for additional instructions.

## Laravel sales order demo

Directory: `docker/laravel-sales-order`

Highlights:

* Laravel 10 application scaffolded via Sail, upgraded to run with PHP-FPM 8.3, Node 20 and
  Tailwind CSS for the SPA-like admin pages.
* Screens: customer maintenance, SKU maintenance, delivery addresses, order entry.
* Postgres is used as the relational database (connection provided through environment file).
* Nginx serves the compiled assets and proxies PHP-FPM.
* A companion container seeds demo data and exposes API documentation via Laravel OpenAPI.

See `docker/laravel-sales-order/README.md` for setup steps, schema description and how to run
artisan migrations/seeds.

## Charting gallery

Directory: `docker/charts`

* Each subfolder inside `apps/` contains a minimal web application showcasing the named
  JavaScript charting library.
* Chart demos share a ClickHouse database (`charts` schema) pre-populated using the ETL
  workflows.  Every app fetches the same GDP per capita series through a lightweight
  backend (Tiny FastAPI server) fronted by nginx.
* `docker-compose.charts.yml` launches: the backend API, eleven nginx containers serving the
  static demos, and the master nginx which reverse proxies traffic based on sub-paths.

Routing layout:

```
/master -> main landing page (links to each demo)
/master/chartjs -> Chart.js dashboard
/master/d3 -> D3.js dashboard
...
```

Follow the instructions in `docker/charts/README.md` to build assets, ingest data and browse
all dashboards.

## Data ingestion and orchestration

Directory: `docker/data-ingestion`

* **Airbyte** – docker-compose file wraps the official Open Source distribution.  Example
  configuration (`airbyte/config/worldbank-clickhouse.json`) creates a connection that pulls
  World Bank indicators and ingests them into ClickHouse.
* **Apache Hop** – includes a lightweight Hop server plus pipeline definition located in
  `apache-hop/pipelines/worldbank_to_clickhouse.hpl`.
* **Apache Airflow** – simplified docker-compose based on the official Quick Start.  A DAG
  (`airflow/dags/worldbank_to_clickhouse.py`) downloads the Apache log dataset and loads it
  into ClickHouse staging tables.

Each orchestrator reads/writes from the shared ClickHouse service defined in the core stack.
Detailed run books live in the respective README files.

## Logging stack ("promtail + rest log + receivers")

Directory: `docker/logging-stack`

This folder packages Grafana Loki with Promtail agents and a ready-to-use Grafana instance.
Promtail scrapes nginx access logs as well as the downloaded dataset files.  The stack offers
an example of ingesting the firewall log CSV into Loki and visualising it.

## Language tooling (LangFlow / LangChain / LangGraph)

Directory: `docker/lang`

* LangFlow container with a sample flow definition under `flows/worldbank_qa.json`.
* FastAPI-based LangChain service (`langchain-service`) exposing chain endpoints.
* LangGraph demo script that orchestrates a retrieval-augmented generation pipeline against
  the sample datasets.

All services rely on the shared Redis and ClickHouse deployments.

## High-availability and coordination examples

* **MySQL failover** – `docker/keepalived` contains two MySQL 8.0 containers, one replica and
  two keepalived instances presenting a floating virtual IP.  Use it to understand VRRP
  failover patterns.
* **ZooKeeper ensemble** – `docker/zookeeper-kafka` spins up three ZooKeeper nodes and a Kafka
  broker.  A Kafka Connect container ingests the Apache log dataset into ClickHouse to
  illustrate how a distributed coordination service can be used.

## Front-end gallery

* `docker/react-vue` – contains two independent SPA samples (React and Vue) compiled with
  Vite, using Tailwind for styling and hitting the shared FastAPI backend for data.
* `docker/static-site` – static documentation site generated with Astro, demonstrating a
  "hydrostatic" static rendering workflow and served through nginx.

## Deployment manifests

* `helm/` – umbrella charts exposing configurable values to deploy the services to a
  Kubernetes cluster.  Charts are intentionally slim, relying on the container assets that
  ship with this repository.
* `nomad/` – Nomad job specs that translate the compose stacks into HashiCorp Nomad syntax.

## Next steps

1. Download datasets (`datasets/download.sh` locally or `docker compose -f docker/datasets-downloader/docker-compose.datasets.yml run downloader`).
2. Start the shared services (`docker/core/docker-compose.core.yml`).
3. Bring up the stack you wish to explore.
4. Follow the individual README instructions to seed databases, execute pipelines and browse
   the dashboards or UIs.

For troubleshooting tips, environment variables and advanced topics (TLS termination,
scaling and observability), consult the per-directory documentation.
