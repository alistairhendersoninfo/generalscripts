job "keystonejs" {
  datacenters = ["dc1"]
  type = "service"

  group "keystonejs" {
    network {
      port "web" {
        to = 3002
      }
    }

    task "keystonejs" {
      driver = "docker"
      config {
        image = "ghcr.io/keystonejs/keystone:6.0.2"
      }
    }
  }
}
