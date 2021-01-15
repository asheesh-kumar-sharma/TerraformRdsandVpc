module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-virtega-${terraform.workspace}"

  cidr = var.vpc_cidr_block

  azs             = var.azs
  private_subnets = [var.private-1a_cidr_block, var.private-1b_cidr_block]
  public_subnets  = [var.public-1a_cidr_block, var.public-1b_cidr_block]
  database_subnets= [var.db-1a_cidr_block,var.db-1b_cidr_block]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  
  tags = { //values to be confirmed
    Management = "Terraform",
    Owner = "DevOps",
    Env = "${terraform.workspace}",
    BU = "DevOps-Inf",
    AppName = "n/a",
    CostAllocation = "n/a",
    Backup = "n/a",
    Autoshutdown = "n/a"
  }

  database_subnet_group_tags = {
    Name = "DBSubnetGroup-${terraform.workspace}"
  }
  nat_eip_tags = {
    Name = "NatEIP-${terraform.workspace}"
  }
  igw_tags = {
    Name = "IGW-${terraform.workspace}"
  }
  nat_gateway_tags = {
    Name = "NGW-${terraform.workspace}"
  }
  private_route_table_tags = {
    Name = "RouteTablePrivate-${terraform.workspace}"
  }
  public_route_table_tags = {
    Name = "RouteTablePublic-${terraform.workspace}"
  }
  database_route_table_tags = {
    Name = "RouteTableDB-${terraform.workspace}"
  }
  

  
}