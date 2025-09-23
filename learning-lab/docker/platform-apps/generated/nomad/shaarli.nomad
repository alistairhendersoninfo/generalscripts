job "shaarli" {
  datacenters = ["dc1"]
  type = "service"

  group "shaarli" {
    network {
      port "web" {
        to = 8083
      }
    }

    task "shaarli" {
      driver = "docker"
      config {
        image = "shaarli/shaarli:2024.02.2"
      }
    }
  }
}
