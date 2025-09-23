job "reportserver" {
  datacenters = ["dc1"]
  type = "service"

  group "reportserver" {
    network {
      port "web" {
        to = 8083
      }
    }

    task "reportserver" {
      driver = "docker"
      config {
        image = "aditosoftware/reportserver:4.8"
      }
    }
  }
}
