job "woodpecker-ci" {
  datacenters = ["dc1"]
  type = "service"

  group "woodpecker-ci" {
    network {
      port "web" {
        to = 8001
      }
    }

    task "woodpecker-ci" {
      driver = "docker"
      config {
        image = "woodpeckerci/woodpecker-server:v2.0.1"
      }
    }
  }
}
