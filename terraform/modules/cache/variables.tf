variable "cache_image" {
  description = "Docker image for Redis"
  type        = string
}

variable "cache_port" {
  description = "Port for Redis"
  type        = number
  default     = 6379
}

variable "network_name" {
  description = "Nombre de la red de Docker"
  type        = string
}