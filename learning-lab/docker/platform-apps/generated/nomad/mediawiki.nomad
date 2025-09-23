job "mediawiki" {
  datacenters = ["dc1"]
  type = "service"

  group "mediawiki" {
    network {
      port "web" {
        to = 8087
      }
    }

    task "mediawiki" {
      driver = "docker"
      config {
        image = "mediawiki:1.41"
      }
    }
  }
}
