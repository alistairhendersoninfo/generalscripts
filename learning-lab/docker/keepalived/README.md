# MySQL with keepalived failover

Demonstrates a VRRP pair fronting two MySQL instances.  Adjust the virtual IP in the
configuration files to match your network before running (host networking is required for
keepalived to broadcast VRRP packets).

```bash
docker compose -f docker-compose.keepalived.yml up -d
```

Monitor the virtual IP (default `192.168.50.10`) and switch off the primary container to observe
failover behaviour.
