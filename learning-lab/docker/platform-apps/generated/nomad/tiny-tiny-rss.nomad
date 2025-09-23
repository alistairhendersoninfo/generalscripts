job "tiny-tiny-rss" {
  datacenters = ["dc1"]
  type = "service"

  group "tiny-tiny-rss" {
    network {
      port "web" {
        to = 8088
      }
    }

    task "tiny-tiny-rss" {
      driver = "docker"
      config {
        image = "cthulhoo/ttrss-fpm-pgsql:2024-04-14"
      }
    }
  }
}
