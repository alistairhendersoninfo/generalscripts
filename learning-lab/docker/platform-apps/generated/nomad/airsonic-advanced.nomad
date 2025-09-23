job "airsonic-advanced" {
  datacenters = ["dc1"]
  type = "service"

  group "airsonic-advanced" {
    network {
      port "web" {
        to = 4040
      }
    }

    task "airsonic-advanced" {
      driver = "docker"
      config {
        image = "airsonicadvanced/airsonic-advanced:11.0.0"
      }
    }
  }
}
