job "resourcespace" {
  datacenters = ["dc1"]
  type = "service"

  group "resourcespace" {
    network {
      port "web" {
        to = 3015
      }
    }

    task "resourcespace" {
      driver = "docker"
      config {
        image = "mondora/resourcespace:10.2"
      }
    }
  }
}
