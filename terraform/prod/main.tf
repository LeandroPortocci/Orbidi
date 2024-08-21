module "vpc" {
  source        = "../modules/vpc"
  region        = "us-east-1"
  vpc_cidr      = "10.1.0.0/16"
  vpc_name      = "prod-vpc"
  public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
  azs           = ["us-east-1a", "us-east-1b"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
