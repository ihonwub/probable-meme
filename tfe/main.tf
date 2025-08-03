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
  source  = "https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v5.19.0"

  name                = "try-vpc"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
}
