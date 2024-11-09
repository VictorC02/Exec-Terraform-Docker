terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {}

# Crear el volumen de Docker para la base de datos
resource "docker_volume" "db_data_volume" {
  name = "postgres-data-volume"
}

resource "docker_network" "app_network" {
  name = "app-network"
}

resource "docker_volume" "shared_volume" {
  name = "shared_static_files"
}

module "app" {
  source = "./modules/app"

  db_host = var.db_host
  db_name = var.db_name
  db_password = var.db_password
  db_user = var.db_user

  cache_host = var.cache_host

  app_image = var.app_image
  app_instance_count = var.node_env == "production" ? 3 : 2 
  external_port_app = var.external_port_app

  shared_name = docker_volume.shared_volume.name
  node_env = var.node_env

  network_name = docker_network.app_network.name

  # Agregar `depends_on` para que el módulo `app` dependa de `database` y `cache`
  depends_on = [
    module.database,
    module.cache
  ]
}

module "database" {
  source = "./modules/database"

  db_image    = var.db_image
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password

  network_name = docker_network.app_network.name

  # Pasar el volumen como variable al módulo
  volume_name = docker_volume.db_data_volume.name

}

module "cache" {
  source = "./modules/cache"

  cache_image = var.cache_image

  network_name = docker_network.app_network.name
}

module "balanceador"{
  source = "./modules/balanceador"

  external_port_haproxy = var.external_port_haproxy
  app_instance_count = var.node_env == "production" ? 3 : 2 
  network_name = docker_network.app_network.name
  shared_name = docker_volume.shared_volume.name

  depends_on = [ module.app ]
}

module "monitorizacion"{
  source = "./modules/monitorizacion"

  external_port_grafana = var.external_port_grafana
  external_port_node_exporter = var.external_port_node_exporter
  external_port_prometheus = var.external_port_prometheus

  network_name = docker_network.app_network.name

  depends_on = [ module.app ]
}

module "static" {
  source = "./modules/static"

  storage_image = var.storage_image
  shared_name = docker_volume.shared_volume.name
  network_name = docker_network.app_network.name
}