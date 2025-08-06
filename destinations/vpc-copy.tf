module "vpc-copy_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-copy"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = false
}

output "vpc-copy-vpc_id" {
  value = module.vpc-copy_vpc.vpc_id
}

output "vpc-copy-vpc_name" {
  value = module.vpc-copy_vpc.name
}
