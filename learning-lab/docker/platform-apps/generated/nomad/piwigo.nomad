job "piwigo" {
  datacenters = ["dc1"]
  type = "service"

  group "piwigo" {
    network {
      port "web" {
        to = 3011
      }
    }

    task "piwigo" {
      driver = "docker"
      config {
        image = "linuxserver/piwigo:latest"
      }
    }
  }
}
