job "redash" {
  datacenters = ["dc1"]
  type = "service"

  group "redash" {
    network {
      port "web" {
        to = 5000
      }
    }

    task "redash" {
      driver = "docker"
      config {
        image = "redash/redash:10.1.0.b50633"
      }
    }
  }
}
