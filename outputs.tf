output "alb_dns_name" {
  description = "DNS público del Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.alb.alb_arn
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = module.alb.target_group_arn
}
