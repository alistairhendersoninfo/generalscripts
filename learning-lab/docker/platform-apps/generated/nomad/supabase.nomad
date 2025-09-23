job "supabase" {
  datacenters = ["dc1"]
  type = "service"

  group "supabase" {
    network {
      port "web" {
        to = 5433
      }
    }

    task "supabase" {
      driver = "docker"
      config {
        image = "supabase/postgres:15.1.0.68"
      }
    }
  }
}
