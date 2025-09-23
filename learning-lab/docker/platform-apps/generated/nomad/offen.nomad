job "offen" {
  datacenters = ["dc1"]
  type = "service"

  group "offen" {
    network {
      port "web" {
        to = 9877
      }
    }

    task "offen" {
      driver = "docker"
      config {
        image = "offen/docker:23.2.0"
      }
    }
  }
}
