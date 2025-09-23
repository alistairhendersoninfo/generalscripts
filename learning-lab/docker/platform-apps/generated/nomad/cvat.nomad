job "cvat" {
  datacenters = ["dc1"]
  type = "service"

  group "cvat" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "cvat" {
      driver = "docker"
      config {
        image = "openvinotoolkit/cvat-server:2.13.0"
      }
    }
  }
}
