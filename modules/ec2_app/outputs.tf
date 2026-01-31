output "instance_id" {
  description = "ID de la instancia EC2 de la app"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "IP publica de la instancia EC2 de la app"
  value       = aws_instance.app.public_ip
}

output "private_ip" {
  description = "IP privada de la instancia EC2 de la app"
  value       = aws_instance.app.private_ip
}

