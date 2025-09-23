job "uvdesk" {
  datacenters = ["dc1"]
  type = "service"

  group "uvdesk" {
    network {
      port "web" {
        to = 8089
      }
    }

    task "uvdesk" {
      driver = "docker"
      config {
        image = "uvdesk/helpdesk:1.0.19"
      }
    }
  }
}
