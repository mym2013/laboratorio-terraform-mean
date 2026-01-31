# IP pública de la instancia Web
output "web_public_ip" {
  description = "IP pública de la instancia Web"
  value       = module.ec2_app.public_ip
}

# IP privada de la instancia Web
output "web_private_ip" {
  description = "IP privada de la instancia Web"
  value       = module.ec2_app.private_ip
}

# IP privada de la instancia MongoDB
output "mongo_private_ip" {
  description = "IP privada de la instancia MongoDB"
  value       = module.ec2_mongo.private_ip
}

# DNS del Application Load Balancer
output "alb_dns_name" {
  description = "DNS del balanceador de carga"
  value       = module.alb.dns_name
}

# IP pública del NAT Gateway
output "nat_gateway_public_ip" {
  description = "IP pública del NAT Gateway"
  value       = module.network.nat_public_ip
}
