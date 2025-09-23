# Hydrostatic static site demo

Drop-in nginx container that serves the contents of the `site/` directory.  Replace the
placeholder files with the generated output of an Astro (or similar) build to showcase
hydration-friendly static sites.

```bash
docker build -t learning-lab/hydrostatic-site .
```

The master proxy exposes the site at `/static/`.
