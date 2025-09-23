job "hedgedoc" {
  datacenters = ["dc1"]
  type = "service"

  group "hedgedoc" {
    network {
      port "web" {
        to = 8090
      }
    }

    task "hedgedoc" {
      driver = "docker"
      config {
        image = "quay.io/hedgedoc/hedgedoc:1.9.9"
      }
    }
  }
}
