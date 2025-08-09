module "vpc" {
    
    source = "terraform-aws-modules/vpc/aws"
    version = "3.14.0"

    name = var.vpc_name
    cidr = var.vpc_cidr

    azs = var.azs
    public_subnets = var.public_subnets_cidr
    public_subnet_tags = var.public_subnet_tags

    tags = var.tags
}