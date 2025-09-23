# Dataset acquisition

This directory contains the shell script used throughout the lab to download the open data
sets referenced by the different demos.  The script can be executed locally or through a
container to guarantee reproducibility.

## Local execution

```bash
chmod +x download.sh
./download.sh
```

By default the assets are stored under `./data`.  Set the `DATA_ROOT` environment variable to
pick a different destination.

## Containerised execution

The datasets Docker image (see `docker/datasets-downloader`) runs the same script in a minimal
Alpine container:

```bash
docker compose -f ../docker/datasets-downloader/docker-compose.datasets.yml run --rm downloader
```

Downloads:

* `worldbank/` – ZIP archives produced by the World Bank API (GDP, GDP per capita, population).
* `logs/` – Apache log sample and CIC-IDS network flow dataset.
* `pcap/` – single HTTP capture from the Wireshark sample collection.

Several downloads are large (> 3GB) and may require a reliable network connection.
