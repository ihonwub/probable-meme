module "platformX-org-vpc-example-27549_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "platformX-org-vpc-example-27549"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = false
  create_igw         = false
  tags                = {
        Environment = "dev"
    Owner = "@ihonwub"
    Project = "promise-vpc-hcp"
    Purpose = "test-updates"
    Team = "Platform Engineering"
  }
}

output "platformX-org-vpc-example-27549-vpc_id" {
  value = module.platformX-org-vpc-example-27549_vpc.vpc_id
}

output "platformX-org-vpc-example-27549-vpc_name" {
  value = module.platformX-org-vpc-example-27549_vpc.name
}
