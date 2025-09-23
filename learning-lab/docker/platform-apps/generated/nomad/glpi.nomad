job "glpi" {
  datacenters = ["dc1"]
  type = "service"

  group "glpi" {
    network {
      port "web" {
        to = 8086
      }
    }

    task "glpi" {
      driver = "docker"
      config {
        image = "diouxx/glpi:10.0.12"
      }
    }
  }
}
