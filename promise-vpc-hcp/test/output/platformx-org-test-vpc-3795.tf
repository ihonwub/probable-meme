module "platformx-org-test-vpc-3795_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "platformx-org-test-vpc-3795"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
  create_igw         = false
  tags                = {
    
  }
}

output "platformx-org-test-vpc-3795-vpc_id" {
  value = module.platformx-org-test-vpc-3795_vpc.vpc_id
}

output "platformx-org-test-vpc-3795-vpc_name" {
  value = module.platformx-org-test-vpc-3795_vpc.name
}
