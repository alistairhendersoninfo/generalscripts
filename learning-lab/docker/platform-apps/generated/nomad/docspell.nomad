job "docspell" {
  datacenters = ["dc1"]
  type = "service"

  group "docspell" {
    network {
      port "web" {
        to = 7880
      }
    }

    task "docspell" {
      driver = "docker"
      config {
        image = "eikek0/docspell-restserver:23.3.0"
      }
    }
  }
}
