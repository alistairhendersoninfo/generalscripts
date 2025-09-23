job "flarum" {
  datacenters = ["dc1"]
  type = "service"

  group "flarum" {
    network {
      port "web" {
        to = 8102
      }
    }

    task "flarum" {
      driver = "docker"
      config {
        image = "mondedie/flarum:1.8.1"
      }
    }
  }
}
