job "lab-core" {
  datacenters = ["dc1"]
  type = "service"

  group "postgres" {
    network { port "db" { static = 5432 } }
    task "postgres" {
      driver = "docker"
      config {
        image = "postgres:16-alpine"
        port_map { db = 5432 }
      }
      env {
        POSTGRES_USER = "laravel"
        POSTGRES_PASSWORD = "laravel"
        POSTGRES_DB = "sales"
      }
      service {
        name = "postgres"
        port = "db"
      }
    }
  }

  group "clickhouse" {
    network { port "tcp" { static = 9000 } }
    task "clickhouse" {
      driver = "docker"
      config {
        image = "clickhouse/clickhouse-server:23.8"
        port_map { tcp = 9000 }
      }
      env {
        CLICKHOUSE_DB = "analytics"
        CLICKHOUSE_USER = "analytics"
        CLICKHOUSE_PASSWORD = "analytics"
      }
      service {
        name = "clickhouse"
        port = "tcp"
      }
    }
  }

  group "redis" {
    network { port "cache" { static = 6379 } }
    task "redis" {
      driver = "docker"
      config {
        image = "redis:7-alpine"
        args  = ["redis-server", "--save", "60", "1"]
        port_map { cache = 6379 }
      }
      service {
        name = "redis"
        port = "cache"
      }
    }
  }

  group "minio" {
    network {
      port "api" { static = 9000 }
      port "console" { static = 9001 }
    }
    task "minio" {
      driver = "docker"
      config {
        image = "minio/minio:RELEASE.2024-03-30T00-08-50Z"
        args = ["server", "/data", "--console-address", ":9001"]
        port_map {
          api = 9000
          console = 9001
        }
      }
      env {
        MINIO_ROOT_USER = "minio"
        MINIO_ROOT_PASSWORD = "minio123"
      }
      service { name = "minio" port = "api" }
    }
  }

  group "gateway" {
    network { port "http" { static = 8080 } }
    task "nginx" {
      driver = "docker"
      config {
        image = "learning-lab/charts-master:latest"
        port_map { http = 80 }
      }
      service {
        name = "gateway"
        port = "http"
      }
    }
  }
}
