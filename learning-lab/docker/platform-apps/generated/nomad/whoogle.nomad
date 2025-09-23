job "whoogle" {
  datacenters = ["dc1"]
  type = "service"

  group "whoogle" {
    network {
      port "web" {
        to = 5000
      }
    }

    task "whoogle" {
      driver = "docker"
      config {
        image = "benbusby/whoogle-search:latest"
      }
    }
  }
}
