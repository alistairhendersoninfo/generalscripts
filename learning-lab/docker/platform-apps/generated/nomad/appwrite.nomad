job "appwrite" {
  datacenters = ["dc1"]
  type = "service"

  group "appwrite" {
    network {
      port "web" {
        to = 8089
      }
    }

    task "appwrite" {
      driver = "docker"
      config {
        image = "appwrite/appwrite:1.5.3"
      }
    }
  }
}
