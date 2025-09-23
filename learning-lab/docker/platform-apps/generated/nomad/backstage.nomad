job "backstage" {
  datacenters = ["dc1"]
  type = "service"

  group "backstage" {
    network {
      port "web" {
        to = 7007
      }
    }

    task "backstage" {
      driver = "docker"
      config {
        image = "ghcr.io/backstage/backstage:1.24.0"
      }
    }
  }
}
