job "ackee" {
  datacenters = ["dc1"]
  type = "service"

  group "ackee" {
    network {
      port "web" {
        to = 3001
      }
    }

    task "ackee" {
      driver = "docker"
      config {
        image = "electerious/ackee:3.5.0"
      }
    }
  }
}
