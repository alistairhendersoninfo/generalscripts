job "photoprism" {
  datacenters = ["dc1"]
  type = "service"

  group "photoprism" {
    network {
      port "web" {
        to = 2342
      }
    }

    task "photoprism" {
      driver = "docker"
      config {
        image = "photoprism/photoprism:20240330"
      }
    }
  }
}
