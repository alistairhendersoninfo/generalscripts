job "bookwyrm" {
  datacenters = ["dc1"]
  type = "service"

  group "bookwyrm" {
    network {
      port "web" {
        to = 8103
      }
    }

    task "bookwyrm" {
      driver = "docker"
      config {
        image = "bookwyrm/bookwyrm:production"
      }
    }
  }
}
