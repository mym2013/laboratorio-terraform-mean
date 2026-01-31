output "alb_dns_name" {
  description = "DNS público del ALB"
  value       = aws_lb.this.dns_name
}

output "alb_arn" {
  description = "ARN del ALB"
  value       = aws_lb.this.arn
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = aws_lb_target_group.this.arn
}
