job "rancher" {
  datacenters = ["dc1"]
  type = "service"

  group "rancher" {
    network {
      port "web" {
        to = 9080
      }
    }

    task "rancher" {
      driver = "docker"
      config {
        image = "rancher/rancher:latest"
      }
    }
  }
}
