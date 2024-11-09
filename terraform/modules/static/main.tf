terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "storage_image" {
  name = var.storage_image
  build {
    context    = abspath("${path.module}")
  }
}

resource "docker_container" "storage_container" {
  name  = "storage_container"
  image = docker_image.storage_image.name

  mounts {
    target = "/shared_files"
    source = var.shared_name
    type   = "volume"
  }

  restart = "on-failure"
  must_run = true
  
  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}
