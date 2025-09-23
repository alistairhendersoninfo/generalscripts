job "librechat" {
  datacenters = ["dc1"]
  type = "service"

  group "librechat" {
    network {
      port "web" {
        to = 3080
      }
    }

    task "librechat" {
      driver = "docker"
      config {
        image = "ghcr.io/danny-avila/librechat:latest"
      }
    }
  }
}
