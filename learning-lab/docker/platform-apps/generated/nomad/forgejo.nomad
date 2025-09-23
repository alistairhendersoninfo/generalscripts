job "forgejo" {
  datacenters = ["dc1"]
  type = "service"

  group "forgejo" {
    network {
      port "web" {
        to = 3001
      }
    }

    task "forgejo" {
      driver = "docker"
      config {
        image = "codeberg.org/forgejo/forgejo:1.21.7-0"
      }
    }
  }
}
