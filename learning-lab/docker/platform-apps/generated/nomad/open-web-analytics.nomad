job "open-web-analytics" {
  datacenters = ["dc1"]
  type = "service"

  group "open-web-analytics" {
    network {
      port "web" {
        to = 8081
      }
    }

    task "open-web-analytics" {
      driver = "docker"
      config {
        image = "openwebanalytics/owa:1.7.6"
      }
    }
  }
}
