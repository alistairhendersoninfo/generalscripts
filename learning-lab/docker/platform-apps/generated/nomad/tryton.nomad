job "tryton" {
  datacenters = ["dc1"]
  type = "service"

  group "tryton" {
    network {
      port "web" {
        to = 8000
      }
    }

    task "tryton" {
      driver = "docker"
      config {
        image = "tryton/tryton:7.2"
      }
    }
  }
}
