job "zammad" {
  datacenters = ["dc1"]
  type = "service"

  group "zammad" {
    network {
      port "web" {
        to = 8085
      }
    }

    task "zammad" {
      driver = "docker"
      config {
        image = "zammad/zammad:6.3.0"
      }
    }
  }
}
