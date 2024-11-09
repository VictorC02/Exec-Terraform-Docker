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