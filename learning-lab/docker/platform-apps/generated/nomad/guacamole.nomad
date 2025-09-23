job "guacamole" {
  datacenters = ["dc1"]
  type = "service"

  group "guacamole" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "guacamole" {
      driver = "docker"
      config {
        image = "guacamole/guacamole:1.5.3"
      }
    }
  }
}
