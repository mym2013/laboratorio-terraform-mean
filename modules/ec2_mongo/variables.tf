variable "instance_type" {
  type        = string
  description = "Tipo de instancia"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet (misma VPC)"
}

variable "sg_id" {
  type        = string
  description = "Security Group de Mongo"
}

variable "key_name" {
  type        = string
  description = "Key pair existente"
}

variable "ami_id" {
  type        = string
  description = "AMI base (Amazon Linux/Ubuntu) para Mongo"
  default     = "ami-0c02fb55956c7d316"
}

