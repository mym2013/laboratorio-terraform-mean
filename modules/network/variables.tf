variable "project_name" {
  description = "Nombre del proyecto (prefijo de naming/tags)"
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
  description = "Lista de CIDRs para las subnets públicas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de AZs donde crear las subnets públicas"
  type        = list(string)
}
