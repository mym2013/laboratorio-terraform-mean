variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "my_ip" {
  description = "IP publica para acceso SSH"
  type        = string
}

variable "key_name" {
  description = "Key pair existente en AWS"
  type        = string
}

variable "ami_id" {
  description = "AMI creada con Packer"
  type        = string
}
