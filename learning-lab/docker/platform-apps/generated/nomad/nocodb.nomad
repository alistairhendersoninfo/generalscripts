job "nocodb" {
  datacenters = ["dc1"]
  type = "service"

  group "nocodb" {
    network {
      port "web" {
        to = 8084
      }
    }

    task "nocodb" {
      driver = "docker"
      config {
        image = "nocodb/nocodb:0.204.7"
      }
    }
  }
}
