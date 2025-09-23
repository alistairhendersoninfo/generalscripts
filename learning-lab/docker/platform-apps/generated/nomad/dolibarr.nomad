job "dolibarr" {
  datacenters = ["dc1"]
  type = "service"

  group "dolibarr" {
    network {
      port "web" {
        to = 8091
      }
    }

    task "dolibarr" {
      driver = "docker"
      config {
        image = "tuxgasy/dolibarr:17.0.3"
      }
    }
  }
}
