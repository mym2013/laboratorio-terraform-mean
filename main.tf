terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.network.vpc_id
  my_ip  = var.my_ip
}

module "ec2_app" {
  source = "./modules/ec2_app"

  ami_id    = var.ami_id
  subnet_id = module.network.public_subnet_id
  sg_id     = module.security_groups.app_sg_id
  key_name  = var.key_name
}

module "ec2_mongo" {
  source = "./modules/ec2_mongo"

  subnet_id = module.network.public_subnet_id
  sg_id     = module.security_groups.mongo_sg_id
  key_name  = var.key_name
}


