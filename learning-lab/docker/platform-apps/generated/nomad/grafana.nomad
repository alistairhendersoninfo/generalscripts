job "grafana" {
  datacenters = ["dc1"]
  type = "service"

  group "grafana" {
    network {
      port "web" {
        to = 3000
      }
    }

    task "grafana" {
      driver = "docker"
      config {
        image = "grafana/grafana:10.4.1"
      }
    }
  }
}
