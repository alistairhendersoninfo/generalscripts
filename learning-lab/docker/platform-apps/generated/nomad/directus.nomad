job "directus" {
  datacenters = ["dc1"]
  type = "service"

  group "directus" {
    network {
      port "web" {
        to = 8055
      }
    }

    task "directus" {
      driver = "docker"
      config {
        image = "directus/directus:10.8.3"
      }
    }
  }
}
