job "gitea" {
  datacenters = ["dc1"]
  type = "service"

  group "gitea" {
    network {
      port "web" {
        to = 3000
      }
      port "web1" {
        to = 2222
      }
    }

    task "gitea" {
      driver = "docker"
      config {
        image = "gitea/gitea:1.21.6"
      }
    }
  }
}
