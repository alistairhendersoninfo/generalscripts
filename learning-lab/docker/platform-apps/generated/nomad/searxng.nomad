job "searxng" {
  datacenters = ["dc1"]
  type = "service"

  group "searxng" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "searxng" {
      driver = "docker"
      config {
        image = "searxng/searxng:2024.04.22-16c45362"
      }
    }
  }
}
