terraform {
  backend "s3" {
    bucket         = "leandroportocciterraformstate"  # Substitua pelo nome do seu bucket S3
    key            = "/prod/terraform.tfstate"  # Caminho dentro do bucket para o arquivo de state
    region         = "us-east-2"  # Região do bucket S3
    dynamodb_table = "terraform-state-locking"  # Nome da tabela DynamoDB para state locking (opcional)
    encrypt        = true  # Habilita criptografia no arquivo de state
  }
}