job "netdata" {
  datacenters = ["dc1"]
  type = "service"

  group "netdata" {
    network {
      port "web" {
        to = 19999
      }
    }

    task "netdata" {
      driver = "docker"
      config {
        image = "netdata/netdata:stable"
      }
    }
  }
}
