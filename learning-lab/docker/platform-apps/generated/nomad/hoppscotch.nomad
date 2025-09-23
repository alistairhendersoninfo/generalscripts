job "hoppscotch" {
  datacenters = ["dc1"]
  type = "service"

  group "hoppscotch" {
    network {
      port "web" {
        to = 3004
      }
    }

    task "hoppscotch" {
      driver = "docker"
      config {
        image = "hoppscotch/hoppscotch:latest"
      }
    }
  }
}
