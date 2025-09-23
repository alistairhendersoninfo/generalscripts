job "parse-platform" {
  datacenters = ["dc1"]
  type = "service"

  group "parse-platform" {
    network {
      port "web" {
        to = 1337
      }
    }

    task "parse-platform" {
      driver = "docker"
      config {
        image = "parseplatform/parse-server:6.4.0"
      }
    }
  }
}
