# Imagen de Docker para PostgreSQL
variable "db_image" {
  description = "Docker image for PostgreSQL database"
  type        = string
}

# Nombre de la base de datos
variable "db_name" {
  description = "Name of the database to be created"
  type        = string
}

# Usuario de la base de datos
variable "db_user" {
  description = "Username for the PostgreSQL database"
  type        = string
}

# Contraseña de la base de datos
variable "db_password" {
  description = "Password for the PostgreSQL database user"
  type        = string
}

# Puerto de PostgreSQL (opcional)
variable "db_port" {
  description = "Port on which the PostgreSQL database will be accessible"
  type        = number
  default     = 5432
}

variable "network_name" {
  description = "Nombre de la red de Docker"
  type        = string
}

variable "volume_name" {
  description = "El volumen donde se almacenarán los datos de la base de datos"
  type        = string
}
