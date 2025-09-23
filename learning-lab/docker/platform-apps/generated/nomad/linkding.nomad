job "linkding" {
  datacenters = ["dc1"]
  type = "service"

  group "linkding" {
    network {
      port "web" {
        to = 9090
      }
    }

    task "linkding" {
      driver = "docker"
      config {
        image = "sissbruecker/linkding:1.27.0"
      }
    }
  }
}
