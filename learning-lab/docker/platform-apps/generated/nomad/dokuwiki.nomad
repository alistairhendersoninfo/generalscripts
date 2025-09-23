job "dokuwiki" {
  datacenters = ["dc1"]
  type = "service"

  group "dokuwiki" {
    network {
      port "web" {
        to = 8088
      }
    }

    task "dokuwiki" {
      driver = "docker"
      config {
        image = "linuxserver/dokuwiki:latest"
      }
    }
  }
}
