job "peertube" {
  datacenters = ["dc1"]
  type = "service"

  group "peertube" {
    network {
      port "web" {
        to = 9000
      }
    }

    task "peertube" {
      driver = "docker"
      config {
        image = "chocobozzz/peertube:6.1.0"
      }
    }
  }
}
