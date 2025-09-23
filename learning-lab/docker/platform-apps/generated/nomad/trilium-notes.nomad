job "trilium-notes" {
  datacenters = ["dc1"]
  type = "service"

  group "trilium-notes" {
    network {
      port "web" {
        to = 8092
      }
    }

    task "trilium-notes" {
      driver = "docker"
      config {
        image = "zadam/trilium:0.63.5"
      }
    }
  }
}
