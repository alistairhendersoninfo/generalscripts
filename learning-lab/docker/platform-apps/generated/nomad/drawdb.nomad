job "drawdb" {
  datacenters = ["dc1"]
  type = "service"

  group "drawdb" {
    network {
      port "web" {
        to = 3009
      }
    }

    task "drawdb" {
      driver = "docker"
      config {
        image = "awesomedata/drawdb:latest"
      }
    }
  }
}
