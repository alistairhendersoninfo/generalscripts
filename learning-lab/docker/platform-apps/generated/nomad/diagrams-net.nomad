job "diagrams-net" {
  datacenters = ["dc1"]
  type = "service"

  group "diagrams-net" {
    network {
      port "web" {
        to = 3008
      }
    }

    task "diagrams-net" {
      driver = "docker"
      config {
        image = "jgraph/drawio:23.0.4"
      }
    }
  }
}
