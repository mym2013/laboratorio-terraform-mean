
variable "ami_id" {
  type        = string
  description = "AMI de la app (Packer)"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet pública"
}

variable "sg_id" {
  type        = string
  description = "Security Group de la app"
}

variable "key_name" {
  type        = string
  description = "Key pair existente"
}
