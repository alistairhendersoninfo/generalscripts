job "authentik" {
  datacenters = ["dc1"]
  type = "service"

  group "authentik" {
    network {
      port "web" {
        to = 9000
      }
    }

    task "authentik" {
      driver = "docker"
      config {
        image = "ghcr.io/goauthentik/server:2024.3.1"
      }
    }
  }
}
