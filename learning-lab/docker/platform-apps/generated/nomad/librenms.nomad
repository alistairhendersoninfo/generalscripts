job "librenms" {
  datacenters = ["dc1"]
  type = "service"

  group "librenms" {
    network {
      port "web" {
        to = 8095
      }
    }

    task "librenms" {
      driver = "docker"
      config {
        image = "librenms/librenms:23.12.0"
      }
    }
  }
}
