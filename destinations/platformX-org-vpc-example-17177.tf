module "platformX-org-vpc-example-17177_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "platformX-org-vpc-example-17177"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = false
  create_igw         = false
  tags                = jsondecode("{
  "Environment": "dev",
  "Owner": "DevOps",
  "Purpose": "test-updates"
}")
}

output "platformX-org-vpc-example-17177-vpc_id" {
  value = module.platformX-org-vpc-example-17177_vpc.vpc_id
}

output "platformX-org-vpc-example-17177-vpc_name" {
  value = module.platformX-org-vpc-example-17177_vpc.name
}
