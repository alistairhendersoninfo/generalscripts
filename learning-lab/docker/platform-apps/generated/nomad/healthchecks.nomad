job "healthchecks" {
  datacenters = ["dc1"]
  type = "service"

  group "healthchecks" {
    network {
      port "web" {
        to = 8000
      }
    }

    task "healthchecks" {
      driver = "docker"
      config {
        image = "healthchecks/healthchecks:2.4"
      }
    }
  }
}
