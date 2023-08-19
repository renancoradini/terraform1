######
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }

  }
}

locals {
  name     = "denzelrr"
  rds_name = "denzelrr_rds"
  region   = "us-east-1"
}
provider "aws" {
  region     = "us-west-2"
  access_key = var.accessKey
  secret_key = var.secretKey
}

#  provider "aws" {
#    alias   = "acm_provider"
#    region  = "us-east-1"
#   access_key = var.accessKey
#   secret_key = var.secretKey
#  }


# VPC Config
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2"

  name = local.name
  cidr = "172.31.0.0/16"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["172.31.0.0/20", "172.31.16.0/20", "172.31.32.0/20"]

  create_database_subnet_group = true
  enable_dns_hostnames         = true

  enable_nat_gateway  = false
# single_nat_gateway  = false
#  reuse_nat_ips       = true
# external_nat_ip_ids = aws_eip.eip_nat.*.id

}

#Elastic IP for NAT Gateway
# resource "aws_eip" "eip_nat" {
#   vpc = true
# }


# resource "aws_internet_gateway" "IGW" {
# vpc_id =  module.vpc.id
# }

# # Create EIP for the IGW
# resource "aws_eip" "myEIP" {
#    vpc   = true
#  }