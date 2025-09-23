job "etherpad" {
  datacenters = ["dc1"]
  type = "service"

  group "etherpad" {
    network {
      port "web" {
        to = 8091
      }
    }

    task "etherpad" {
      driver = "docker"
      config {
        image = "etherpad/etherpad:1.9.7"
      }
    }
  }
}
