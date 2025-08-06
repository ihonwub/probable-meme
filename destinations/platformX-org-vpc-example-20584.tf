module "platformX-org-vpc-example-20584_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-example"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
  create_igw         = true
}

output "platformX-org-vpc-example-20584-vpc_id" {
  value = module.platformX-org-vpc-example-20584_vpc.vpc_id
}

output "platformX-org-vpc-example-20584-vpc_name" {
  value = module.platformX-org-vpc-example-20584_vpc.name
}
