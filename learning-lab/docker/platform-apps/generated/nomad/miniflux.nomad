job "miniflux" {
  datacenters = ["dc1"]
  type = "service"

  group "miniflux" {
    network {
      port "web" {
        to = 8087
      }
    }

    task "miniflux" {
      driver = "docker"
      config {
        image = "miniflux/miniflux:2.0.49"
      }
    }
  }
}
