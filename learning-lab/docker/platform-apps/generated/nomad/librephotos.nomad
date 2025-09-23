job "librephotos" {
  datacenters = ["dc1"]
  type = "service"

  group "librephotos" {
    network {
      port "web" {
        to = 3010
      }
    }

    task "librephotos" {
      driver = "docker"
      config {
        image = "reallibrephotos/librephotos:2024.03.03"
      }
    }
  }
}
