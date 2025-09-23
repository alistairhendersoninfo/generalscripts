job "zitadel" {
  datacenters = ["dc1"]
  type = "service"

  group "zitadel" {
    network {
      port "web" {
        to = 8081
      }
    }

    task "zitadel" {
      driver = "docker"
      config {
        image = "ghcr.io/zitadel/zitadel:2.48.0"
      }
    }
  }
}
