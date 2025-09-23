job "kutt" {
  datacenters = ["dc1"]
  type = "service"

  group "kutt" {
    network {
      port "web" {
        to = 8000
      }
    }

    task "kutt" {
      driver = "docker"
      config {
        image = "kutt/kutt:latest"
      }
    }
  }
}
