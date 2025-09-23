# Helm charts

Helm blueprints translating the primary docker-compose stacks into Kubernetes manifests.  Each
chart exposes a `values.yaml` mirroring the environment variables used by the containers.

Charts included:

* `core` – PostgreSQL, ClickHouse, Redis, MinIO and the master nginx gateway.

Deploy example:

```bash
helm install lab-core ./core -n learning-lab --create-namespace
```

Extend the charts to cover the remaining stacks by following the same pattern (Deployments plus
Services/Ingress resources that point to the container images defined in `learning-lab/docker`).
