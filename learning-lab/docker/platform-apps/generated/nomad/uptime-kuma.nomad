job "uptime-kuma" {
  datacenters = ["dc1"]
  type = "service"

  group "uptime-kuma" {
    network {
      port "web" {
        to = 3001
      }
    }

    task "uptime-kuma" {
      driver = "docker"
      config {
        image = "louislam/uptime-kuma:1.23.7"
      }
    }
  }
}
