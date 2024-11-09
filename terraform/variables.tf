# Imagen de Docker para la aplicación Node.js
variable "app_image" {
  description = "Docker image for the Node.js application"
  type        = string
}

# Imagen de Docker para PostgreSQL
variable "db_image" {
  description = "Docker image for PostgreSQL database"
  type        = string
}

# Host de la base de datos (nombre del contenedor de la base de datos)
variable "db_host" {
  description = "Hostname of the PostgreSQL database"
  type        = string
}

# Usuario de la base de datos
variable "db_user" {
  description = "Username for connecting to the PostgreSQL database"
  type        = string
}

# Nombre de la base de datos
variable "db_name" {
  description = "Name of the database to be created"
  type        = string
}

# Contraseña de la base de datos
variable "db_password" {
  description = "Password for connecting to the PostgreSQL database"
  type        = string
}

variable "cache_image" {
  description = "Image for Redis"
  type        = string
}

variable "cache_host" {
  description = "Host for Redis"
  type        = string
}

variable "node_env" {
  description = "Production or Dev"
  type        = string
}

variable "volume_name" {
  description = "Nombre del volumen de datos para la base de datos"
  type        = string
}

variable "external_port_grafana" {
  description = "Puerto externo de Grafana"
  type        = number
}

variable "external_port_prometheus" {
  description = "Puerto externo de Prometheus"
  type        = number
}

variable "external_port_node_exporter" {
  description = "Puerto externo de Node-Exporter"
  type        = number
}

variable "external_port_haproxy" {
  description = "Puerto externo de haproxy"
  type        = number
}

variable "external_port_app" {
  description = "Puerto externo de la app"
  type        = number
}

variable "storage_image" {
  description = "Docker image for the Node.js application"
  type        = string
}