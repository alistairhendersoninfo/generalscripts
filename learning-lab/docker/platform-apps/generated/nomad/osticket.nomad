job "osticket" {
  datacenters = ["dc1"]
  type = "service"

  group "osticket" {
    network {
      port "web" {
        to = 8087
      }
    }

    task "osticket" {
      driver = "docker"
      config {
        image = "osticket/osticket:1.18"
      }
    }
  }
}
