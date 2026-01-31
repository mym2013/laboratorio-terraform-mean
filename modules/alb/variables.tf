variable "name" {
  description = "Nombre base para el Application Load Balancer"
  type        = string
  default     = "mean-alb"
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega el ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "Lista de subnets publicas donde se despliega el ALB"
  type        = list(string)
}

variable "target_instance_id" {
  description = "ID de la instancia EC2 de la aplicacion"
  type        = string
}

variable "app_sg_id" {
  description = "Security Group ID de la instancia de la aplicacion"
  type        = string
}
