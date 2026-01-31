variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "mean-lab"
}

variable "environment" {
  description = "Entorno"
  type        = string
  default     = "dev"
}

variable "my_ip" {
  description = "IP publica para SSH (x.x.x.x/32)"
  type        = string
}

variable "key_name" {
  description = "Key pair existente en AWS"
  type        = string
}
