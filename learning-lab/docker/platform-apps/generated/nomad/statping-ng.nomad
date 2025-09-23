job "statping-ng" {
  datacenters = ["dc1"]
  type = "service"

  group "statping-ng" {
    network {
      port "web" {
        to = 8082
      }
    }

    task "statping-ng" {
      driver = "docker"
      config {
        image = "statping-ng/statping-ng:latest"
      }
    }
  }
}
