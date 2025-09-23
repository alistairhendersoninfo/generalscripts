job "paperless-ngx" {
  datacenters = ["dc1"]
  type = "service"

  group "paperless-ngx" {
    network {
      port "web" {
        to = 8093
      }
    }

    task "paperless-ngx" {
      driver = "docker"
      config {
        image = "ghcr.io/paperless-ngx/paperless-ngx:2.7.2"
      }
    }
  }
}
