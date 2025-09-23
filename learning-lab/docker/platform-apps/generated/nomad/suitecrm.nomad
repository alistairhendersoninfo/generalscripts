job "suitecrm" {
  datacenters = ["dc1"]
  type = "service"

  group "suitecrm" {
    network {
      port "web" {
        to = 8093
      }
    }

    task "suitecrm" {
      driver = "docker"
      config {
        image = "bitnami/suitecrm:8.6.2"
      }
    }
  }
}
