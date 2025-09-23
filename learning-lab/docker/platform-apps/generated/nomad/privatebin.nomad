job "privatebin" {
  datacenters = ["dc1"]
  type = "service"

  group "privatebin" {
    network {
      port "web" {
        to = 8085
      }
    }

    task "privatebin" {
      driver = "docker"
      config {
        image = "privatebin/nginx-fpm-alpine:1.6.2"
      }
    }
  }
}
