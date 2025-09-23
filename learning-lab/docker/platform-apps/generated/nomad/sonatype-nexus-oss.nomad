job "sonatype-nexus-oss" {
  datacenters = ["dc1"]
  type = "service"

  group "sonatype-nexus-oss" {
    network {
      port "web" {
        to = 8082
      }
    }

    task "sonatype-nexus-oss" {
      driver = "docker"
      config {
        image = "sonatype/nexus3:3.68.1"
      }
    }
  }
}
