job "lightdash" {
  datacenters = ["dc1"]
  type = "service"

  group "lightdash" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "lightdash" {
      driver = "docker"
      config {
        image = "lightdash/lightdash:0.520.0"
      }
    }
  }
}
