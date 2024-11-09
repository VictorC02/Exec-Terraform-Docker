variable "shared_name" {
  description = "Nombre del volumen compartido"
  type        = string
}

variable "storage_image" {
  description = "Docker image for the Node.js application"
  type        = string
}

variable "network_name" {
  description = "Nombre de la red de Docker"
  type        = string
}