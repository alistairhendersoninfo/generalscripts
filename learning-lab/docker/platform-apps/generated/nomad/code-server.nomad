job "code-server" {
  datacenters = ["dc1"]
  type = "service"

  group "code-server" {
    network {
      port "web" {
        to = 8081
      }
    }

    task "code-server" {
      driver = "docker"
      config {
        image = "codercom/code-server:4.91.1"
      }
    }
  }
}
