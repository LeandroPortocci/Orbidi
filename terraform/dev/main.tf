module "vpc" {
  source        = "../modules/vpc"
  region        = "us-east-2"
  vpc_cidr      = "10.0.0.0/16"
  vpc_name      = "dev-vpc"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs           = ["us-east-2a", "us-east-2b"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
