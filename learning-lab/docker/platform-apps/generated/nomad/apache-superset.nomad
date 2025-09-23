job "apache-superset" {
  datacenters = ["dc1"]
  type = "service"

  group "apache-superset" {
    network {
      port "web" {
        to = 8088
      }
    }

    task "apache-superset" {
      driver = "docker"
      config {
        image = "apache/superset:3.1.0"
      }
    }
  }
}
