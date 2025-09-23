job "minio" {
  datacenters = ["dc1"]
  type = "service"

  group "minio" {
    network {
      port "web" {
        to = 9000
      }
      port "web1" {
        to = 9001
      }
    }

    task "minio" {
      driver = "docker"
      config {
        image = "minio/minio:RELEASE.2024-03-30T00-08-50Z"
      }
    }
  }
}
