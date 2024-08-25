# backend.tf
terraform {
  backend "s3" {
    bucket         = "leandroportocciterraformstate"
    key            = "terraform.tfstate"  # Aqui o caminho é fixo
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}
