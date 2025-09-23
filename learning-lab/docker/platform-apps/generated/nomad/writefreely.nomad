job "writefreely" {
  datacenters = ["dc1"]
  type = "service"

  group "writefreely" {
    network {
      port "web" {
        to = 8105
      }
    }

    task "writefreely" {
      driver = "docker"
      config {
        image = "writeas/writefreely:latest"
      }
    }
  }
}
