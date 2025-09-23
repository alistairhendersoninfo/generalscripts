# Dataset downloader container

Builds a minimal Alpine image that runs the shared `datasets/download.sh` script.  Intended
for use in CI pipelines or when you prefer containerised tooling.

```bash
docker compose -f docker-compose.datasets.yml build
# first run downloads into learning-lab/datasets/data
mkdir -p ../../datasets/data
docker compose -f docker-compose.datasets.yml run --rm downloader
```
