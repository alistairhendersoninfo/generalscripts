job "yourls" {
  datacenters = ["dc1"]
  type = "service"

  group "yourls" {
    network {
      port "web" {
        to = 8084
      }
    }

    task "yourls" {
      driver = "docker"
      config {
        image = "yourls:1.9.2"
      }
    }
  }
}
