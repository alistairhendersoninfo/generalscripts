job "jenkins" {
  datacenters = ["dc1"]
  type = "service"

  group "jenkins" {
    network {
      port "web" {
        to = 8080
      }
    }

    task "jenkins" {
      driver = "docker"
      config {
        image = "jenkins/jenkins:lts-jdk17"
      }
    }
  }
}
