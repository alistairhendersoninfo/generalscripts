job "chartmuseum" {
  datacenters = ["dc1"]
  type = "service"

  group "chartmuseum" {
    network {
      port "web" {
        to = 8087
      }
    }

    task "chartmuseum" {
      driver = "docker"
      config {
        image = "chartmuseum/chartmuseum:v0.14.0"
      }
    }
  }
}
