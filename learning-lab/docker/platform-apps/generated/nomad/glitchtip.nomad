job "glitchtip" {
  datacenters = ["dc1"]
  type = "service"

  group "glitchtip" {
    network {
      port "web" {
        to = 9000
      }
    }

    task "glitchtip" {
      driver = "docker"
      config {
        image = "glitchtip/glitchtip:3.2.2"
      }
    }
  }
}
