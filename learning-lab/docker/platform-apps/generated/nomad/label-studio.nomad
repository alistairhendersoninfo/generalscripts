job "label-studio" {
  datacenters = ["dc1"]
  type = "service"

  group "label-studio" {
    network {
      port "web" {
        to = 8082
      }
    }

    task "label-studio" {
      driver = "docker"
      config {
        image = "heartexlabs/label-studio:1.11.0"
      }
    }
  }
}
