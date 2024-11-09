terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}
resource "docker_image" "redis_image" {
  name = var.cache_image
}

resource "docker_container" "cache" {
  name  = "cache"
  image = docker_image.redis_image.name
  ports {
    internal = 6379
    external = var.cache_port
  }

  # Comando para inicializar un valor clave-valor en Redis
  entrypoint = [
    "sh", "-c",
    "redis-server --protected-mode no & sleep 2 && redis-cli set clave1 'valor1' && tail -f /dev/null"
  ]

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}

