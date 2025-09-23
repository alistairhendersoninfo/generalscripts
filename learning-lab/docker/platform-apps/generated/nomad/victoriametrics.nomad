job "victoriametrics" {
  datacenters = ["dc1"]
  type = "service"

  group "victoriametrics" {
    network {
      port "web" {
        to = 8428
      }
    }

    task "victoriametrics" {
      driver = "docker"
      config {
        image = "victoriametrics/victoria-metrics:v1.101.0"
      }
    }
  }
}
