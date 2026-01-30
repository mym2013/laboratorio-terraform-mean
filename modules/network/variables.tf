 
variable "project_name" {
  type        = string
  description = "Nombre base para tags"
  default     = "mean-terraform"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR de la VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR subnet publica"
  default     = "10.0.1.0/24"
}

variable "az" {
  type        = string
  description = "Availability Zone"
  default     = "us-east-1a"
}
