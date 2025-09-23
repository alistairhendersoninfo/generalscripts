job "konga" {
  datacenters = ["dc1"]
  type = "service"

  group "konga" {
    network {
      port "web" {
        to = 1338
      }
    }

    task "konga" {
      driver = "docker"
      config {
        image = "pantsel/konga:latest"
      }
    }
  }
}
