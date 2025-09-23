job "anythingllm" {
  datacenters = ["dc1"]
  type = "service"

  group "anythingllm" {
    network {
      port "web" {
        to = 3000
      }
    }

    task "anythingllm" {
      driver = "docker"
      config {
        image = "mintplexlabs/anything-llm:latest"
      }
    }
  }
}
