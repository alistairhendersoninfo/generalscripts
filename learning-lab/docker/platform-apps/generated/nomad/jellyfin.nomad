job "jellyfin" {
  datacenters = ["dc1"]
  type = "service"

  group "jellyfin" {
    network {
      port "web" {
        to = 8099
      }
    }

    task "jellyfin" {
      driver = "docker"
      config {
        image = "jellyfin/jellyfin:10.8.13"
      }
    }
  }
}
