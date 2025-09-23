job "hasura-graphql-engine" {
  datacenters = ["dc1"]
  type = "service"

  group "hasura-graphql-engine" {
    network {
      port "web" {
        to = 8088
      }
    }

    task "hasura-graphql-engine" {
      driver = "docker"
      config {
        image = "hasura/graphql-engine:v2.40.0"
      }
    }
  }
}
