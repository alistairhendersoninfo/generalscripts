job "navidrome" {
  datacenters = ["dc1"]
  type = "service"

  group "navidrome" {
    network {
      port "web" {
        to = 4533
      }
    }

    task "navidrome" {
      driver = "docker"
      config {
        image = "deluan/navidrome:0.50.2"
      }
    }
  }
}
