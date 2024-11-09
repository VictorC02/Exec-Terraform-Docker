# Imagen de Docker para la aplicación Node.js
variable "app_image" {
  description = "Docker image for the Node.js application"
  type        = string
}

# Puerto de la aplicación
variable "app_port" {
  description = "Port on which the application will be accessible externally"
  type        = number
  default     = 3000
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

# Contraseña de la base de datos
variable "db_password" {
  description = "Password for connecting to the PostgreSQL database"
  type        = string
}

# Nombre de la base de datos
variable "db_name" {
  description = "Name of the database to connect to"
  type        = string
}

# Puerto de la base de datos (opcional)
variable "db_port" {
  description = "Port on which the PostgreSQL database is accessible"
  type        = number
  default     = 5432
}

variable "cache_port" {
  description = "Port for Redis"
  type        = number
  default     = 6379
}

variable "cache_host" {
  description = "Host for Redis"
  type        = string
}

variable "node_env" {
  description = "Host for Redis"
  type        = string
}

variable "network_name" {
  description = "Nombre de la red de Docker"
  type        = string
}

variable "app_instance_count" {
  description = "Number of app instances to create"
  type        = number
}

variable "external_port_app" {
  description = "Puerto externo de la app"
  type        = number
}

variable "shared_name" {
  description = "Nombre del volumen compartido"
  type        = string
}
