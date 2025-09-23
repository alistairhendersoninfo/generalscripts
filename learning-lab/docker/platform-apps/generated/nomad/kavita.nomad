job "kavita" {
  datacenters = ["dc1"]
  type = "service"

  group "kavita" {
    network {
      port "web" {
        to = 5000
      }
    }

    task "kavita" {
      driver = "docker"
      config {
        image = "kizaing/kavita:0.7.3"
      }
    }
  }
}
