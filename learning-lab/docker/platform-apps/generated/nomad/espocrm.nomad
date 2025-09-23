job "espocrm" {
  datacenters = ["dc1"]
  type = "service"

  group "espocrm" {
    network {
      port "web" {
        to = 8092
      }
    }

    task "espocrm" {
      driver = "docker"
      config {
        image = "espocrm/espocrm:8.3.4"
      }
    }
  }
}
