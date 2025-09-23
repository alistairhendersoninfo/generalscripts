job "pimcore" {
  datacenters = ["dc1"]
  type = "service"

  group "pimcore" {
    network {
      port "web" {
        to = 3016
      }
    }

    task "pimcore" {
      driver = "docker"
      config {
        image = "pimcore/pimcore:11.1.0-apache"
      }
    }
  }
}
