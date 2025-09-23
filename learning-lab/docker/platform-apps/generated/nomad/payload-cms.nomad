job "payload-cms" {
  datacenters = ["dc1"]
  type = "service"

  group "payload-cms" {
    network {
      port "web" {
        to = 3003
      }
    }

    task "payload-cms" {
      driver = "docker"
      config {
        image = "payloadcms/payload:latest"
      }
    }
  }
}
