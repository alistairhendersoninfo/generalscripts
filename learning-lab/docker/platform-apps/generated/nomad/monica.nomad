job "monica" {
  datacenters = ["dc1"]
  type = "service"

  group "monica" {
    network {
      port "web" {
        to = 8094
      }
    }

    task "monica" {
      driver = "docker"
      config {
        image = "monica:latest"
      }
    }
  }
}
