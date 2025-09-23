# EngineWorks Pivot demo

Renders a small pivot table using [`eclipxe/engineworks-pivot`](https://github.com/eclipxe13/engineworks-pivot). The demo preloads regional sales data into the library's in-memory result model and formats it with the built-in XHTML table formatter.

## Run
```bash
docker compose -f docker-compose.engineworks-pivot.yml up --build
```
Open http://localhost:8124 to view the pivot.
