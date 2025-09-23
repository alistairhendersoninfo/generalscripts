job "freshrss" {
  datacenters = ["dc1"]
  type = "service"

  group "freshrss" {
    network {
      port "web" {
        to = 8086
      }
    }

    task "freshrss" {
      driver = "docker"
      config {
        image = "freshrss/freshrss:1.22.1"
      }
    }
  }
}
