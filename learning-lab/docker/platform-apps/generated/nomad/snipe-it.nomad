job "snipe-it" {
  datacenters = ["dc1"]
  type = "service"

  group "snipe-it" {
    network {
      port "web" {
        to = 8090
      }
    }

    task "snipe-it" {
      driver = "docker"
      config {
        image = "snipe/snipe-it:6.4.2"
      }
    }
  }
}
