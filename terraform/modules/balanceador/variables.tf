variable "network_name" {
  description = "Nombre de la red de Docker"
  type        = string
}

variable "app_instance_count" {
  description = "Numero de instancias de la app"
  type        = number
}

variable "external_port_haproxy" {
  description = "Puerto externo de haproxy"
  type        = number
}

variable "shared_name" {
  description = "Nombre del volumen compartido"
  type        = string
}