job "framadate" {
  datacenters = ["dc1"]
  type = "service"

  group "framadate" {
    network {
      port "web" {
        to = 8081
      }
    }

    task "framadate" {
      driver = "docker"
      config {
        image = "framasoft/framadate:latest"
      }
    }
  }
}
