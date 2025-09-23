job "danswer" {
  datacenters = ["dc1"]
  type = "service"

  group "danswer" {
    network {
      port "web" {
        to = 8083
      }
    }

    task "danswer" {
      driver = "docker"
      config {
        image = "danny-avila/danswer:latest"
      }
    }
  }
}
