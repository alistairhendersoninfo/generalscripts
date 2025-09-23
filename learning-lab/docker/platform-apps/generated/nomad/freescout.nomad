job "freescout" {
  datacenters = ["dc1"]
  type = "service"

  group "freescout" {
    network {
      port "web" {
        to = 8088
      }
    }

    task "freescout" {
      driver = "docker"
      config {
        image = "tiredofit/freescout:1.12.1"
      }
    }
  }
}
