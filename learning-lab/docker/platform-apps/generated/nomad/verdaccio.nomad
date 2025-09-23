job "verdaccio" {
  datacenters = ["dc1"]
  type = "service"

  group "verdaccio" {
    network {
      port "web" {
        to = 4873
      }
    }

    task "verdaccio" {
      driver = "docker"
      config {
        image = "verdaccio/verdaccio:6.0"
      }
    }
  }
}
