job "tube-archivist" {
  datacenters = ["dc1"]
  type = "service"

  group "tube-archivist" {
    network {
      port "web" {
        to = 8000
      }
    }

    task "tube-archivist" {
      driver = "docker"
      config {
        image = "bbilly1/tubearchivist:latest"
      }
    }
  }
}
