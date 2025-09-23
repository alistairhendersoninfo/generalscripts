job "mediagoblin" {
  datacenters = ["dc1"]
  type = "service"

  group "mediagoblin" {
    network {
      port "web" {
        to = 3014
      }
    }

    task "mediagoblin" {
      driver = "docker"
      config {
        image = "quay.io/mediagoblin/mediagoblin:0.12.0"
      }
    }
  }
}
