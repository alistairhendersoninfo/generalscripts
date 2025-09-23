job "drone-ci" {
  datacenters = ["dc1"]
  type = "service"

  group "drone-ci" {
    network {
      port "web" {
        to = 8081
      }
    }

    task "drone-ci" {
      driver = "docker"
      config {
        image = "drone/drone:2"
      }
    }
  }
}
