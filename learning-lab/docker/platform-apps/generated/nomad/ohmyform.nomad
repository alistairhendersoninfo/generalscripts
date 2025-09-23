job "ohmyform" {
  datacenters = ["dc1"]
  type = "service"

  group "ohmyform" {
    network {
      port "web" {
        to = 5000
      }
    }

    task "ohmyform" {
      driver = "docker"
      config {
        image = "ohmyform/ohmyform:1.1.0"
      }
    }
  }
}
