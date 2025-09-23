job "keycloak" {
  datacenters = ["dc1"]
  type = "service"

  group "keycloak" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "keycloak" {
      driver = "docker"
      config {
        image = "quay.io/keycloak/keycloak:24.0.4"
      }
    }
  }
}
