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

# CI/CD Pipeline para FastAPI e Django

Este repositório contém a configuração para um pipeline CI/CD que automatiza o build e deploy de aplicações FastAPI e Django em ambientes AWS ECS. O pipeline utiliza GitHub Actions para realizar a integração contínua e a entrega contínua (CI/CD), com deploys distintos para os ambientes de desenvolvimento e produção.

## Estrutura do Repositório

O repositório é organizado da seguinte forma:

- `fastapi-app/`: Contém o código e o Dockerfile para a aplicação FastAPI.
- `django-app/`: Contém o código e o Dockerfile para a aplicação Django.
- `terraform/`: Contém a configuração do Terraform para a infraestrutura AWS.
- `.github/workflows/`: Contém o arquivo de configuração do workflow do GitHub Actions para CI/CD.

## Configuração do Workflow

O pipeline é configurado para ser acionado por `push` e `pull request` nas branches `development` e `main`. Dependendo da branch, o pipeline realiza o deploy para o ambiente de desenvolvimento ou produção. A configuração do workflow é encontrada no arquivo `.github/workflows/ci-cd-pipeline.yml`.

### Workflow do GitHub Actions

O arquivo `ci-cd-pipeline.yml` realiza as seguintes etapas:

1. **Checkout do Código**:
   ```yaml
   - name: Checkout code
     uses: actions/checkout@v3
Faz o checkout do código do repositório.

Configuração do Docker Buildx:

yaml
Copiar código
- name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v2
Configura o Docker Buildx para construir as imagens Docker.

Login no Amazon ECR:

yaml
Copiar código
- name: Log in to Amazon ECR
  run: aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 061039781993.dkr.ecr.us-east-2.amazonaws.com
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
Faz login no Amazon Elastic Container Registry (ECR) para enviar as imagens Docker.

Build e Push das Imagens Docker:

yaml
Copiar código
- name: Build and push FastAPI image
  run: |
    cd fastapi-app
    docker build -t fastapi-app .
    docker tag fastapi-app:latest 061039781993.dkr.ecr.us-east-2.amazonaws.com/demoorbidi/fastapi-app:${{ github.ref_name }}
    docker push 061039781993.dkr.ecr.us-east-2.amazonaws.com/demoorbidi/fastapi-app:${{ github.ref_name }}

- name: Build and push Django image
  run: |
    cd django-app
    docker build -t django-app .
    docker tag django-app:latest 061039781993.dkr.ecr.us-east-2.amazonaws.com/demoorbidi/django-app:${{ github.ref_name }}
    docker push 061039781993.dkr.ecr.us-east-2.amazonaws.com/demoorbidi/django-app:${{ github.ref_name }}
Constrói e envia as imagens Docker para o repositório ECR. As imagens são tagueadas com o nome da branch (development ou main).

Deploy para o ECS:

Ambiente de Desenvolvimento:

yaml
Copiar código
- name: Deploy FastAPI service to ECS
  if: github.ref == 'refs/heads/development'
  run: |
    aws ecs update-service --cluster development-cluster --service fastapi-service-development --force-new-deployment --region us-east-2
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

- name: Deploy Django service to ECS
  if: github.ref == 'refs/heads/development'
  run: |
    aws ecs update-service --cluster development-cluster --service django-service-development --force-new-deployment --region us-east-2
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
Realiza o deploy das imagens Docker para o ambiente de desenvolvimento (cluster e serviços específicos).

Ambiente de Produção:

yaml
Copiar código
- name: Deploy FastAPI service to ECS
  if: github.ref == 'refs/heads/main'
  run: |
    aws ecs update-service --cluster production-cluster --service fastapi-service-production --force-new-deployment --region us-east-2
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

- name: Deploy Django service to ECS
  if: github.ref == 'refs/heads/main'
  run: |
    aws ecs update-service --cluster production-cluster --service django-service-production --force-new-deployment --region us-east-2
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
Realiza o deploy das imagens Docker para o ambiente de produção (cluster e serviços específicos).

Configuração dos Secrets
Certifique-se de adicionar os seguintes secrets ao seu repositório GitHub para que o pipeline possa acessar a AWS:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
Estrutura dos Diretórios
fastapi-app/: Contém o Dockerfile e o código da aplicação FastAPI.
django-app/: Contém o Dockerfile e o código da aplicação Django.
terraform/: Contém a configuração do Terraform para infraestrutura AWS.
.github/workflows/: Contém a configuração do workflow CI/CD.
Uso
Para acionar o pipeline, faça um push ou um pull request nas branches development ou main. O pipeline irá automaticamente construir as imagens Docker, enviá-las para o ECR e realizar o deploy nos ambientes de desenvolvimento ou produção, respectivamente.

Contribuição
Para contribuir com este repositório, faça um fork, crie uma branch de feature e submeta um pull request com suas alterações.

Licença
Este projeto está licenciado sob a MIT License.