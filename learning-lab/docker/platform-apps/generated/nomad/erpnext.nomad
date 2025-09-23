job "erpnext" {
  datacenters = ["dc1"]
  type = "service"

  group "erpnext" {
    network {
      port "web" {
        to = 8002
      }
    }

    task "erpnext" {
      driver = "docker"
      config {
        image = "frappe/erpnext-worker:version-14"
      }
    }
  }
}
