variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Entorno (dev, qa, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Subnets públicas para el ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security Group del ALB"
  type        = string
}
