job "kbin" {
  datacenters = ["dc1"]
  type = "service"

  group "kbin" {
    network {
      port "web" {
        to = 8104
      }
    }

    task "kbin" {
      driver = "docker"
      config {
        image = "ernado/kbin:0.11.1"
      }
    }
  }
}
