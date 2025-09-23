job "odoo-community" {
  datacenters = ["dc1"]
  type = "service"

  group "odoo-community" {
    network {
      port "web" {
        to = 8069
      }
    }

    task "odoo-community" {
      driver = "docker"
      config {
        image = "odoo:17.0"
      }
    }
  }
}
