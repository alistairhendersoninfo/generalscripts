job "xwiki" {
  datacenters = ["dc1"]
  type = "service"

  group "xwiki" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "xwiki" {
      driver = "docker"
      config {
        image = "xwiki:lts-postgres-tomcat"
      }
    }
  }
}
