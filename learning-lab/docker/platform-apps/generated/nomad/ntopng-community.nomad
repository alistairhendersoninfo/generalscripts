job "ntopng-community" {
  datacenters = ["dc1"]
  type = "service"

  group "ntopng-community" {
    network {
      port "web" {
        to = 3002
      }
    }

    task "ntopng-community" {
      driver = "docker"
      config {
        image = "ntop/ntopng:5.8"
      }
    }
  }
}
