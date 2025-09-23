# Platform Application Blueprints

This directory extends the learning lab with metadata-driven blueprints for a large
collection of analytics, CMS, wiki, streaming, developer tooling, monitoring, and
AI-oriented stacks requested by the curriculum. Each entry in [`apps.yaml`](./apps.yaml)
describes the container image, default ports, and quick setup notes for the platform.

Run the generator to produce ready-to-customise assets for Docker Compose, Helm,
and Nomad:

```bash
cd learning-lab/docker/platform-apps
python generate.py
```

The script emits skeletons under `generated/`:

* `generated/docker` – per-app `docker-compose.<slug>.yml` files pre-wired with the
  container image, exposed ports, and external network hook for the shared
  `learning-lab_lab` network created by the core stack. Comments highlight the
  integration or datastore requirements listed in `apps.yaml`.
* `generated/helm` – minimalist Helm charts (Chart.yaml, values, deployment, and
  service templates) that map to the same images and ports for Kubernetes usage.
* `generated/nomad` – single-group Nomad job specs referencing the Docker image
  and port bindings for HashiCorp Nomad or containerd scheduling.

> **Note:** Many of these upstream applications require companion services
> (databases, queues, object storage, etc.). The generator captures those
> expectations in the metadata notes so you can connect them to the existing
> lab core services (`docker/core/docker-compose.core.yml`) or extend the
> generated files with additional services before deploying.

## Workflow

1. Start the shared infrastructure stack if you plan to reuse Postgres, Redis,
   ClickHouse, MinIO, or other lab services:

   ```bash
   cd learning-lab/docker/core
   docker compose -f docker-compose.core.yml up -d
   ```

2. Generate the blueprints and select the application you want to explore.
3. Update the generated Compose/Helm/Nomad file with passwords, secrets, and
   any optional sidecars (for example, Postgres or MongoDB containers) based
   on the accompanying note.
4. Deploy using your scheduler of choice.

Refer to the upstream documentation linked in each application's project for
advanced configuration and production hardening.
