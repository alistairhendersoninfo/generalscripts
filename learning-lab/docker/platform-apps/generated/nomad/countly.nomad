job "countly" {
  datacenters = ["dc1"]
  type = "service"

  group "countly" {
    network {
      port "web" {
        to = 80
      }
    }

    task "countly" {
      driver = "docker"
      config {
        image = "countly/countly-server:22.06"
      }
    }
  }
}
