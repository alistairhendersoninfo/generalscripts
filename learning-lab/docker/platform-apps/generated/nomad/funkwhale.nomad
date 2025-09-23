job "funkwhale" {
  datacenters = ["dc1"]
  type = "service"

  group "funkwhale" {
    network {
      port "web" {
        to = 8536
      }
    }

    task "funkwhale" {
      driver = "docker"
      config {
        image = "thetarkus/funkwhale:1.4.0"
      }
    }
  }
}
