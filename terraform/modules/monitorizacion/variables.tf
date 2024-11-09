variable "network_name" {
  description = "Nombre de la red de Docker"
  type        = string
}

variable "external_port_grafana" {
  description = "Puerto externo de Grafana"
  type = number
}

variable "external_port_prometheus" {
  description = "Puerto externo de Prometheus"
  type = number
}

variable "external_port_node_exporter" {
  description = "Puerto externo de Node-Exporter"
  type = number
}