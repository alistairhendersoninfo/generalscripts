job "quivr" {
  datacenters = ["dc1"]
  type = "service"

  group "quivr" {
    network {
      port "web" {
        to = 3001
      }
    }

    task "quivr" {
      driver = "docker"
      config {
        image = "quivr/quivr:latest"
      }
    }
  }
}
