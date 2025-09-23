job "mayan-edms" {
  datacenters = ["dc1"]
  type = "service"

  group "mayan-edms" {
    network {
      port "web" {
        to = 8094
      }
    }

    task "mayan-edms" {
      driver = "docker"
      config {
        image = "mayanedms/mayanedms:4.5"
      }
    }
  }
}
