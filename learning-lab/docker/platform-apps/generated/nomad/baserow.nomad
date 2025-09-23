job "baserow" {
  datacenters = ["dc1"]
  type = "service"

  group "baserow" {
    network {
      port "web" {
        to = 8085
      }
    }

    task "baserow" {
      driver = "docker"
      config {
        image = "baserow/baserow:1.21.1"
      }
    }
  }
}
