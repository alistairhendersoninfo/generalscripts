job "mediacms" {
  datacenters = ["dc1"]
  type = "service"

  group "mediacms" {
    network {
      port "web" {
        to = 8098
      }
    }

    task "mediacms" {
      driver = "docker"
      config {
        image = "mediacms/mediacms:latest"
      }
    }
  }
}
