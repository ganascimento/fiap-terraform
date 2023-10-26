provider "aws" {
  region = "us-east-2"
}

terraform {
  required_providers {
    aws = "~> 5.0"
  }

  backend "s3" {
    bucket = "terraform-s3-state-fiap"
    key    = "fiap-terraform"
    region = "us-east-2"
  }
}

module "api-gateway" {
  source       = "./modules/api-gateway"
  jwt_audience = module.cognito.user_pool_client_id
  jwt_issuer   = module.cognito.user_pool_endpoint
}

module "cognito" {
  source = "./modules/cognito"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = "fiap-restaurant-g-cluster"
}

module "lambda" {
  source                   = "./modules/lambda"
  lambda_bucket_id         = module.s3.lambda_bucket_id
  apigateway_id            = module.api-gateway.apigateway_id
  apigateway_execution_arn = module.api-gateway.apigateway_execution_arn
}

module "s3" {
  source = "./modules/s3"
}
