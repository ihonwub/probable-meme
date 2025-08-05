module "platformX-org-vpc-copy-8316_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-copy"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
}

output "platformX-org-vpc-copy-8316-vpc_id" {
  value = module.platformX-org-vpc-copy-8316_vpc.vpc_id
}

output "platformX-org-vpc-copy-8316-vpc_name" {
  value = module.platformX-org-vpc-copy-8316_vpc.vpc_name
}
