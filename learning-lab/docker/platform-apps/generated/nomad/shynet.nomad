job "shynet" {
  datacenters = ["dc1"]
  type = "service"

  group "shynet" {
    network {
      port "web" {
        to = 8082
      }
    }

    task "shynet" {
      driver = "docker"
      config {
        image = "milesmcc/shynet:latest"
      }
    }
  }
}
