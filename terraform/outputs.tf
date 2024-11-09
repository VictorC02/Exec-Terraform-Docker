output "external_port_app" {
  description = "Puerto externo de la app"
  value       = var.external_port_app
}

output "haproxy_port" {
  description = "Puerto externo de haproxy"
  value       = var.external_port_haproxy
}

output "db_host" {
  description = "La dirección del host de la base de datos"
  value       = "database"
}

output "db_name" {
  description = "El nombre de la base de datos"
  value       = var.db_name
}

output "db_user" {
  description = "El nombre de usuario para la base de datos"
  value       = var.db_user
}

output "db_password" {
  description = "La contraseña para el usuario de la base de datos"
  value       = var.db_password
}

output "db_volume_name" {
  description = "El nombre del volumen de la base de datos"
  value       = var.volume_name
}

output "external_port_grafana" {
  description = "Puerto externo de Grafana"
  value       = var.external_port_grafana
}

output "external_port_prometheus" {
  description = "Puerto externo de Prometheus"
  value       = var.external_port_prometheus
}

output "external_port_node_exporter" {
  description = "Puerto externo de Node-Exporter"
  value       = var.external_port_node_exporter
}

output "grafana_host" {
  description = "Host de Grafana"
  value       = "grafana"
}

output "prometheus_host" {
  description = "Host de Grafana"
  value       = "prometheus"
}

output "node_exporter_host" {
  description = "Host de Grafana"
  value       = "node-exporter"
}