# Phlow workflow demo

This container installs the [`softius/phlow`](https://github.com/softius/phlow) workflow engine and renders a simple sequential flow in the browser.

## Run
```bash
docker compose -f docker-compose.phlow.yml up --build
```
Then open http://localhost:8121 to execute the workflow and view the model/path rendered with Tailwind styling.
