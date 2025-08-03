module "vpc" {
  source  = "https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v5.19.0"

  name                = "vpc-example"
  cidr                = "10.0.0.0/16"
  enable_nat_gateway  = true
}
