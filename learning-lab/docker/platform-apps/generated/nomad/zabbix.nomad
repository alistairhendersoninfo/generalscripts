job "zabbix" {
  datacenters = ["dc1"]
  type = "service"

  group "zabbix" {
    network {
      port "web" {
        to = 10051
      }
    }

    task "zabbix" {
      driver = "docker"
      config {
        image = "zabbix/zabbix-server-pgsql:7.0-ubuntu"
      }
    }
  }
}
