job "tiddlywiki" {
  datacenters = ["dc1"]
  type = "service"

  group "tiddlywiki" {
    network {
      port "web" {
        to = 8089
      }
    }

    task "tiddlywiki" {
      driver = "docker"
      config {
        image = "tiddlywiki:5.3.2"
      }
    }
  }
}
