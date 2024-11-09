terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "postgres_image" {
  name = var.db_image
}

resource "docker_container" "database" {
  name  = "database"
  image = docker_image.postgres_image.name
  ports {
    internal = 5432
    external = 5432
  }

  # Variables de entorno para configurar PostgreSQL
  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }

  # Montar el volumen en el directorio de datos de PostgreSQL
  volumes {
    volume_name    = var.volume_name
    container_path = "/var/lib/postgresql/data"
  }

  volumes {
    host_path      = abspath("${path.module}/init.sql")
    container_path = "/docker-entrypoint-initdb.d/init.sql"
  }
}
