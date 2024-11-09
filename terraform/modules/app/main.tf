terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_image" {
  name = var.app_image
  build {
    context    = abspath("${path.module}/../../../app")
  }
}

resource "docker_container" "app_container" {

  count = var.app_instance_count

  name  = "app_container_${count.index + 1}"

  image = docker_image.app_image.name
  ports {
    internal = 3000
    external = var.external_port_app + count.index
  }

  mounts {
    target = "/app/shared_files"   # Ruta dentro de tu contenedor de aplicación
    source = var.shared_name       # Nombre del volumen definido anteriormente
    type   = "volume"
  }

  env = [
    "DB_HOST=${var.db_host}",
    "DB_USER=${var.db_user}",
    "DB_PASSWORD=${var.db_password}",
    "DB_NAME=${var.db_name}",
    "DB_PORT=${var.db_port}",
    "REDIS_PORT=${var.cache_port}",
    "REDIS_HOST=${var.cache_host}",
    "NODE_ENV=${var.node_env}",
    "APP_ENV_VAR=${count.index + 1}"
  ]

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}