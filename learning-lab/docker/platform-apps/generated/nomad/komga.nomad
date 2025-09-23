job "komga" {
  datacenters = ["dc1"]
  type = "service"

  group "komga" {
    network {
      port "web" {
        to = 25600
      }
    }

    task "komga" {
      driver = "docker"
      config {
        image = "gotson/komga:1.5.1"
      }
    }
  }
}
