job "photoview" {
  datacenters = ["dc1"]
  type = "service"

  group "photoview" {
    network {
      port "web" {
        to = 3013
      }
    }

    task "photoview" {
      driver = "docker"
      config {
        image = "viktorstrate/photoview:latest"
      }
    }
  }
}
