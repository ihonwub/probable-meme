module "vpc-example_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-example"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
}

output "vpc-example-vpc_id" {
  value = module.vpc-example_vpc.vpc_id
}

output "vpc-example-vpc_name" {
  value = module.vpc-example_vpc.name
}
