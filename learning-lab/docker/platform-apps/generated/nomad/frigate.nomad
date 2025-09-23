job "frigate" {
  datacenters = ["dc1"]
  type = "service"

  group "frigate" {
    network {
      port "web" {
        to = 8978
      }
    }

    task "frigate" {
      driver = "docker"
      config {
        image = "blakeblackshear/frigate:0.13.0"
      }
    }
  }
}
