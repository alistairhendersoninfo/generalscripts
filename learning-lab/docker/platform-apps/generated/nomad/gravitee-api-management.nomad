job "gravitee-api-management" {
  datacenters = ["dc1"]
  type = "service"

  group "gravitee-api-management" {
    network {
      port "web" {
        to = 8086
      }
    }

    task "gravitee-api-management" {
      driver = "docker"
      config {
        image = "graviteeio/apim-management-ui:4.4.0"
      }
    }
  }
}
