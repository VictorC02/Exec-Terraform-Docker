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