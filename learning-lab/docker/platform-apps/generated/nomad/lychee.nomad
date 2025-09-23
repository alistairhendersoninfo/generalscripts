job "lychee" {
  datacenters = ["dc1"]
  type = "service"

  group "lychee" {
    network {
      port "web" {
        to = 3012
      }
    }

    task "lychee" {
      driver = "docker"
      config {
        image = "lycheeorg/lychee:latest"
      }
    }
  }
}
