module "network" {
  source = "./modules/network"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr            = var.vpc_cidr
  public_subnets_cidr = var.public_subnets_cidr
  availability_zones  = var.availability_zones
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.network.vpc_id
  my_ip  = var.my_ip
}


module "alb" {
  source = "./modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id         = module.network.vpc_id
  public_subnets = module.network.public_subnets

  alb_security_group_id = module.security_groups.app_sg_id
}



module "ec2_mongo" {
  source = "./modules/ec2_mongo"

  ami_id = var.app_ami_id
  sg_id  = module.security_groups.mongo_sg_id

  subnet_id     = module.network.public_subnets[0]
  key_name      = var.key_name
  instance_type = var.mongo_instance_type
}


module "ec2_app" {
  source = "./modules/ec2_app"

  ami_id = var.app_ami_id
  sg_id  = module.security_groups.app_sg_id

  subnet_id     = module.network.public_subnets[1]
  key_name      = var.key_name
  instance_type = var.app_instance_type
}
