# ZooKeeper ensemble with Kafka

Three ZooKeeper nodes coordinate a Kafka broker and a Kafka Connect worker.  Use the stack to
demonstrate how distributed services rely on ZooKeeper for leader election and configuration.

```bash
docker compose -f docker-compose.zookeeper.yml up -d
```

Register a Kafka Connect ClickHouse sink to stream the Apache log topic into the `apache_logs`
table once Airflow or other producers publish messages.
