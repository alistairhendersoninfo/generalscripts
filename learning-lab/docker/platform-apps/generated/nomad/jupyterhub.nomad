job "jupyterhub" {
  datacenters = ["dc1"]
  type = "service"

  group "jupyterhub" {
    network {
      port "web" {
        to = 8000
      }
    }

    task "jupyterhub" {
      driver = "docker"
      config {
        image = "jupyterhub/jupyterhub:4.1.5"
      }
    }
  }
}
