terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Escolha a versão adequada
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
