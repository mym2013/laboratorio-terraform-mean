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
