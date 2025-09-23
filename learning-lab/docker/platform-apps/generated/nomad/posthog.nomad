job "posthog" {
  datacenters = ["dc1"]
  type = "service"

  group "posthog" {
    network {
      port "web" {
        to = 8000
      }
    }

    task "posthog" {
      driver = "docker"
      config {
        image = "posthog/posthog:latest"
      }
    }
  }
}
