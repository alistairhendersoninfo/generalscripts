job "motioneye" {
  datacenters = ["dc1"]
  type = "service"

  group "motioneye" {
    network {
      port "web" {
        to = 8765
      }
    }

    task "motioneye" {
      driver = "docker"
      config {
        image = "ccrisan/motioneye:master-amd64"
      }
    }
  }
}
