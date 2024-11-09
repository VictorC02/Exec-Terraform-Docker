terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = "prom/prometheus:latest"
  ports {
    internal = 9090
    external = var.external_port_prometheus
  }
  volumes {
    host_path      = abspath("${path.module}/prometheus")
    container_path = "/etc/prometheus"
  }

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana:latest"
  ports {
    internal = 3000
    external = var.external_port_grafana
  }

  volumes {
    host_path      = abspath("${path.module}/grafana/grafana_dashboard.json")
    container_path = "/var/lib/grafana/dashboards/grafana_dashboard.json"
  }

  env = [
    "GF_SECURITY_ADMIN_USER=admin",
    "GF_SECURITY_ADMIN_PASSWORD=admin",
    "GF_DASHBOARDS_JSON_ENABLED=true",
    "GF_PATHS_PROVISIONING=/var/lib/grafana/provisioning"
  ]

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}

resource "docker_container" "node_exporter" {
  name  = "node-exporter"
  image = "prom/node-exporter:latest"
  ports {
    internal = 9100
    external = var.external_port_node_exporter
  }
  
  volumes {
    host_path      = abspath("${path.module}/../../")
    container_path = "/host"
  }

  # Conectar a la red
  networks_advanced {
    name = var.network_name
  }
}