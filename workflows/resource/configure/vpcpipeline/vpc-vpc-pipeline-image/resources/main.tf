terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.7.0"
    }
  }
}

provider "aws" {
  region = var.region
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = var.name
  cidr               = var.cidr
  enable_nat_gateway = var.enable_nat_gateway

  #   azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  #   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  #   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  #   enable_nat_gateway = var.enable_natenable_nat_gateway
  #   enable_vpn_gateway = true

  #   tags = {
  #     Terraform = "true"
  #     Environment = "dev"
  #   }
}
