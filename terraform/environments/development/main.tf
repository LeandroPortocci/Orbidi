module "vpc" {
  source = "../../modules/vpc"
  cidr_block = local.cidr_block
  public_subnet_cidrs = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
  availability_zones = local.availability_zones
  environment = local.environment
}

module "ecs" {
  source = "../../modules/ecs"
  
  cluster_name      = "${local.environment}-cluster"
  ami_id           = local.ecs_ami_id
  instance_type    = local.ecs_instance_type
  desired_capacity = local.desired_capacity
  min_size         = local.min_size
  max_size         = local.max_size
  subnets          = module.vpc.private_subnet_ids
  security_groups = [module.vpc.app_security_group_id]
  instance_profile = module.ecs-instance-profile.iam_instance_profile_arn
  environment = local.environment
}

module "ecs-instance-profile" {
  source  = "terraform-module/ecs-instance-profile/aws"
  version = "~> 1"

  name = format("%s-profile", local.name)
  tags = merge(local.tags, { Module = "terraform-module/ecs-instance-profile/aws" })
}

module "alb" {
  source = "../../modules/alb"
  vpc_id = module.vpc.vpc_id
  name            = "${local.environment}-alb"
  subnets = module.vpc.public_subnets
  subnet_ids  = module.vpc.public_subnet_ids
  security_groups = module.vpc.alb_security_group_id
  security_group_ids = module.vpc.alb_security_group_id
  certificate_arn = local.alb_certificate_arn
  environment = local.environment

}

module "rds" {
  source = "../../modules/rds"
  
  db_name            = local.db_name
  allocated_storage  = local.allocated_storage
  engine             = local.engine
  instance_class     = local.instance_class
  username           = local.rds_username
  password           = local.rds_password
  subnets            = module.vpc.private_subnet_ids
  security_groups    = [module.vpc.app_security_group_id]
  multi_az           = local.multi_az
  delete_final_snapshot = local.delete_final_snapshot
}

module "bastion" {
  source = "../../modules/bastion"

  ami_id            = local.bastion_ami_id
  instance_type  = local.bastion_instance_type
  subnet_id       = module.vpc.public_subnet_ids[0]
  security_groups = [module.vpc.app_security_group_id]
  key_name         = local.bastion_key_name
  environment      = local.environment
}