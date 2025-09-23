job "harbor" {
  datacenters = ["dc1"]
  type = "service"

  group "harbor" {
    network {
      port "web" {
        to = 8443
      }
    }

    task "harbor" {
      driver = "docker"
      config {
        image = "goharbor/harbor-core:v2.10.0"
      }
    }
  }
}
