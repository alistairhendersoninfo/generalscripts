job "corteza" {
  datacenters = ["dc1"]
  type = "service"

  group "corteza" {
    network {
      port "web" {
        to = 18080
      }
    }

    task "corteza" {
      driver = "docker"
      config {
        image = "cortezaproject/corteza:2023.9"
      }
    }
  }
}
