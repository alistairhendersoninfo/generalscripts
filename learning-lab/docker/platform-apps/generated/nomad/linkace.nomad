job "linkace" {
  datacenters = ["dc1"]
  type = "service"

  group "linkace" {
    network {
      port "web" {
        to = 8094
      }
    }

    task "linkace" {
      driver = "docker"
      config {
        image = "linkace/linkace:1.12.2"
      }
    }
  }
}
