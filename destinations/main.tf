module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name                = "vpc-example"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
}
