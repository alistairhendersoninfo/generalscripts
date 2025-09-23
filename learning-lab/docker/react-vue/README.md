# React and Vue demos

Two lightweight single-page applications consuming the shared `/api/orders/sales_totals`
endpoint.  The apps are intentionally simple and use CDN-delivered frameworks to keep the
containers minimal.

```bash
docker compose -f docker-compose.react-vue.yml up -d --build
```

Once running they can be accessed through the master proxy at `/react-demo/` and `/vue-demo/`.
