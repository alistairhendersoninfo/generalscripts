job "open-streaming-platform" {
  datacenters = ["dc1"]
  type = "service"

  group "open-streaming-platform" {
    network {
      port "web" {
        to = 8097
      }
    }

    task "open-streaming-platform" {
      driver = "docker"
      config {
        image = "opensourcepos/osp:0.9.4"
      }
    }
  }
}
