# Infraestrutura AWS com Terraform - Demo Orbidi

Este projeto usa Terraform para criar uma infraestrutura escalável e segura na AWS para aplicações REST. Ele inclui ambientes para desenvolvimento e produção.

## Estrutura do Projeto

- **modules/**: Módulos reutilizáveis para VPC, ECS, ALB, RDS e ECR.
- **environments/**: Configurações específicas para os ambientes de desenvolvimento e produção.
- **main.tf**: Arquivo principal para definir o provedor e os módulos.
- **backend.tf**: Configuração do backend remoto para armazenar o estado do Terraform.
- **outputs.tf**: Define as saídas dos módulos.
- **variables.tf**: Define variáveis usadas nos módulos e configurações.

## Requisitos

- Terraform 1.0 ou superior
- AWS CLI configurado com permissões adequadas

## Como Usar