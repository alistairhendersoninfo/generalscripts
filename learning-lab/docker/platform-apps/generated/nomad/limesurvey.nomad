job "limesurvey" {
  datacenters = ["dc1"]
  type = "service"

  group "limesurvey" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "limesurvey" {
      driver = "docker"
      config {
        image = "lscr.io/linuxserver/limesurvey:6.5.10"
      }
    }
  }
}
