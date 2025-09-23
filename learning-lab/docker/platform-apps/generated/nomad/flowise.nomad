job "flowise" {
  datacenters = ["dc1"]
  type = "service"

  group "flowise" {
    network {
      port "web" {
        to = 3000
      }
    }

    task "flowise" {
      driver = "docker"
      config {
        image = "flowiseai/flowise:latest"
      }
    }
  }
}
