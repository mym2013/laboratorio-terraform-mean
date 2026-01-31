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
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
}

module "security_groups" {
  source = "./modules/security_group"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.network.vpc_id
  my_ip        = var.my_ip
}

module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  environment       = var.environment
  subnet_id         = module.network.public_subnets[0]
  security_group_id = module.security_groups.ec2_sg_id
  key_name          = var.key_name
}

module "alb" {
  source = "./modules/alb"

  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.network.vpc_id
  public_subnets        = module.network.public_subnets
  alb_security_group_id = module.security_groups.alb_sg_id
}

