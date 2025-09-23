job "discourse" {
  datacenters = ["dc1"]
  type = "service"

  group "discourse" {
    network {
      port "web" {
        to = 8101
      }
    }

    task "discourse" {
      driver = "docker"
      config {
        image = "bitnami/discourse:3.2.2"
      }
    }
  }
}
