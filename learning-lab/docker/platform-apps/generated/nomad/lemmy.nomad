job "lemmy" {
  datacenters = ["dc1"]
  type = "service"

  group "lemmy" {
    network {
      port "web" {
        to = 1236
      }
    }

    task "lemmy" {
      driver = "docker"
      config {
        image = "dessalines/lemmy:0.19.3"
      }
    }
  }
}
