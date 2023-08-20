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
  region   = var.regionset
}
provider "aws" {
  region     = var.regionset
  access_key = var.accessKey
  secret_key = var.secretKey
}

#   provider "aws" {
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
  cidr = var.vpc-cidr

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = [var.pubsub1cidr, pubsub2cidr, pubsub3cidr]

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