job "ampache" {
  datacenters = ["dc1"]
  type = "service"

  group "ampache" {
    network {
      port "web" {
        to = 8100
      }
    }

    task "ampache" {
      driver = "docker"
      config {
        image = "ampache/ampache:6.3.0"
      }
    }
  }
}
