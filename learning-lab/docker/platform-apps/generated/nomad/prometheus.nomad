job "prometheus" {
  datacenters = ["dc1"]
  type = "service"

  group "prometheus" {
    network {
      port "web" {
        to = 9090
      }
    }

    task "prometheus" {
      driver = "docker"
      config {
        image = "prom/prometheus:v2.51.0"
      }
    }
  }
}
