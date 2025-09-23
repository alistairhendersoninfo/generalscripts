job "wiki-js" {
  datacenters = ["dc1"]
  type = "service"

  group "wiki-js" {
    network {
      port "web" {
        to = 3005
      }
    }

    task "wiki-js" {
      driver = "docker"
      config {
        image = "requarks/wiki:2.5.301"
      }
    }
  }
}
