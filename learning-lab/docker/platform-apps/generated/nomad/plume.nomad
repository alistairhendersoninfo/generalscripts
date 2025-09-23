job "plume" {
  datacenters = ["dc1"]
  type = "service"

  group "plume" {
    network {
      port "web" {
        to = 8106
      }
    }

    task "plume" {
      driver = "docker"
      config {
        image = "plumeorg/plume:0.7.2"
      }
    }
  }
}
