job "opensearch-dashboards" {
  datacenters = ["dc1"]
  type = "service"

  group "opensearch-dashboards" {
    network {
      port "web" {
        to = 5601
      }
    }

    task "opensearch-dashboards" {
      driver = "docker"
      config {
        image = "opensearchproject/opensearch-dashboards:2.12.0"
      }
    }
  }
}
