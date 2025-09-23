job "rstudio-server" {
  datacenters = ["dc1"]
  type = "service"

  group "rstudio-server" {
    network {
      port "web" {
        to = 8787
      }
    }

    task "rstudio-server" {
      driver = "docker"
      config {
        image = "rocker/rstudio:4.3.3"
      }
    }
  }
}
