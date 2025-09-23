job "owncast" {
  datacenters = ["dc1"]
  type = "service"

  group "owncast" {
    network {
      port "web" {
        to = 8096
      }
    }

    task "owncast" {
      driver = "docker"
      config {
        image = "owncast/owncast:0.1.3"
      }
    }
  }
}
