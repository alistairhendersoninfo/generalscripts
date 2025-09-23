job "nodebb" {
  datacenters = ["dc1"]
  type = "service"

  group "nodebb" {
    network {
      port "web" {
        to = 4567
      }
    }

    task "nodebb" {
      driver = "docker"
      config {
        image = "nodebb/docker:latest"
      }
    }
  }
}
