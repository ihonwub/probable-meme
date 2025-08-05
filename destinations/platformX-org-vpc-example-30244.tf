module "platformX-org-vpc-example-30244_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-example"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
}

output "platformX-org-vpc-example-30244-vpc_id" {
  value = module.platformX-org-vpc-example-30244_vpc.vpc_id
}

output "platformX-org-vpc-example-30244-vpc_name" {
  value = module.platformX-org-vpc-example-30244_vpc.vpc_name
}
