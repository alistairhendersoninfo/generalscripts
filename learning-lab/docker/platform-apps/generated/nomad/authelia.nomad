job "authelia" {
  datacenters = ["dc1"]
  type = "service"

  group "authelia" {
    network {
      port "web" {
        to = 9091
      }
    }

    task "authelia" {
      driver = "docker"
      config {
        image = "authelia/authelia:4.38.8"
      }
    }
  }
}
