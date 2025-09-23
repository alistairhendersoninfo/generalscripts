job "penpot" {
  datacenters = ["dc1"]
  type = "service"

  group "penpot" {
    network {
      port "web" {
        to = 8095
      }
    }

    task "penpot" {
      driver = "docker"
      config {
        image = "penpotapp/backend:2.1.1"
      }
    }
  }
}
