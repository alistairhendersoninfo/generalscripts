job "excalidraw" {
  datacenters = ["dc1"]
  type = "service"

  group "excalidraw" {
    network {
      port "web" {
        to = 3006
      }
    }

    task "excalidraw" {
      driver = "docker"
      config {
        image = "excalidraw/excalidraw:latest"
      }
    }
  }
}
