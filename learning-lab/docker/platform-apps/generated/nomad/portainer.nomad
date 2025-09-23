job "portainer" {
  datacenters = ["dc1"]
  type = "service"

  group "portainer" {
    network {
      port "web" {
        to = 9443
      }
    }

    task "portainer" {
      driver = "docker"
      config {
        image = "portainer/portainer-ce:2.19.4"
      }
    }
  }
}
