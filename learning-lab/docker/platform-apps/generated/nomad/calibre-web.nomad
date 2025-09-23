job "calibre-web" {
  datacenters = ["dc1"]
  type = "service"

  group "calibre-web" {
    network {
      port "web" {
        to = 8083
      }
    }

    task "calibre-web" {
      driver = "docker"
      config {
        image = "linuxserver/calibre-web:latest"
      }
    }
  }
}
