variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Entorno (dev/stage/prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "CIDRs de subnets públicas (2)"
  type        = list(string)
}

variable "availability_zones" {
  description = "AZs (2)"
  type        = list(string)
}

variable "key_name" {
  description = "Nombre del Key Pair existente en AWS"
  type        = string
}

variable "app_instance_type" {
  description = "Tipo de instancia para la app"
  type        = string
  default     = "t3.micro"
}

variable "mongo_instance_type" {
  description = "Tipo de instancia para Mongo"
  type        = string
  default     = "t3.micro"
}
variable "app_ami_id" {
  description = "AMI ID para la instancia de la APP"
  type        = string
}


