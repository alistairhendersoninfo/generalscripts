job "apiman" {
  datacenters = ["dc1"]
  type = "service"

  group "apiman" {
    network {
      port "web" {
        to = 8087
      }
    }

    task "apiman" {
      driver = "docker"
      config {
        image = "apiman/on-wildfly:3.0.0.Final"
      }
    }
  }
}
