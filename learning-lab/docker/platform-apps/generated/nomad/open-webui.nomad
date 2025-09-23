job "open-webui" {
  datacenters = ["dc1"]
  type = "service"

  group "open-webui" {
    network {
      port "web" {
        to = 8082
      }
    }

    task "open-webui" {
      driver = "docker"
      config {
        image = "ghcr.io/open-webui/open-webui:0.2.7"
      }
    }
  }
}
