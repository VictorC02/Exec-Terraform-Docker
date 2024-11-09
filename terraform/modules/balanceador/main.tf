terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_container" "haproxy" {
  name  = "haproxy_load_balancer"
  image = "haproxy:latest"
  ports {
    internal = 80
    external = var.external_port_haproxy
  }
  restart = "on-failure"
  must_run = true
  
  volumes {
    host_path      = abspath("${path.module}/haproxy.cfg")
    container_path = "/usr/local/etc/haproxy/haproxy.cfg"
  }
  
  mounts {
    target = "/shared_files"   # Ruta dentro de tu contenedor de aplicación
    source = var.shared_name       # Nombre del volumen definido anteriormente
    type   = "volume"
  }

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}

