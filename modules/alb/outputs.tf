output "dns_name" {
  description = "DNS del Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "alb_security_group_id" {
  description = "ID del Security Group asociado al ALB"
  value       = aws_security_group.alb_sg.id
}
