job "metabase" {
  datacenters = ["dc1"]
  type = "service"

  group "metabase" {
    network {
      port "web" {
        to = 3000
      }
    }

    task "metabase" {
      driver = "docker"
      config {
        image = "metabase/metabase:v0.49.11"
      }
    }
  }
}
