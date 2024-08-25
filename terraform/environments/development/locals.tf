locals {
  environment           = terraform.workspace
  aws_region            = "us-east-2"
  availability_zones    = ["us-east-2a", "us-east-2b"]
  cidr_block = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  ecs_ami_id            = "ami-0c55b159cbfafe1f0"
  ecs_instance_type     = "t3.micro"
  desired_capacity = 2
  min_size         = 2
  max_size         = 5
  alb_certificate_arn   = "arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-ab12-cd34-ef56-abcdef123456"
  rds_username          = "dev_user"
  rds_password          = "dev_password"
  db_name            = "mydb"
  allocated_storage  = 20
  engine             = "postgres"
  instance_class     = "db.t3.micro"
  multi_az           = false
  delete_final_snapshot = true
  bastion_ami_id        = "ami-0c55b159cbfafe1f0"
  bastion_instance_type = "t2.micro"
  bastion_key_name      = "dev-key"
  name = terraform.workspace
  tags = {
    Environment = terraform.workspace
  }
}

