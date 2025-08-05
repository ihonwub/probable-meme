module "platformX-org-vpc-copy-14017_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-copy"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = false
}

output "platformX-org-vpc-copy-14017-vpc_id" {
  value = module.platformX-org-vpc-copy-14017_vpc.vpc_id
}

output "platformX-org-vpc-copy-14017-vpc_name" {
  value = module.platformX-org-vpc-copy-14017_vpc.vpc_name
}
