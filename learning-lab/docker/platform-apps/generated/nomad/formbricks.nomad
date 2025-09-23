job "formbricks" {
  datacenters = ["dc1"]
  type = "service"

  group "formbricks" {
    network {
      port "web" {
        to = 3002
      }
    }

    task "formbricks" {
      driver = "docker"
      config {
        image = "ghcr.io/formbricks/formbricks:1.6.0"
      }
    }
  }
}
