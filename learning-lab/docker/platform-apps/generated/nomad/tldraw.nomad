job "tldraw" {
  datacenters = ["dc1"]
  type = "service"

  group "tldraw" {
    network {
      port "web" {
        to = 3007
      }
    }

    task "tldraw" {
      driver = "docker"
      config {
        image = "ghcr.io/tldraw/tldraw:1.0.1"
      }
    }
  }
}
