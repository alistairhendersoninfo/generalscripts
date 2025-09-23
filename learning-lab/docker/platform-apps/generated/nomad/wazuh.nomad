job "wazuh" {
  datacenters = ["dc1"]
  type = "service"

  group "wazuh" {
    network {
      port "web" {
        to = 5602
      }
    }

    task "wazuh" {
      driver = "docker"
      config {
        image = "wazuh/wazuh-dashboard:4.7.2"
      }
    }
  }
}
