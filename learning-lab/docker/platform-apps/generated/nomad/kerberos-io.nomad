job "kerberos-io" {
  datacenters = ["dc1"]
  type = "service"

  group "kerberos-io" {
    network {
      port "web" {
        to = 8081
      }
    }

    task "kerberos-io" {
      driver = "docker"
      config {
        image = "kerberos/kerberos:3.5.0"
      }
    }
  }
}
