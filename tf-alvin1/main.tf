terraform {
  required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "~> 3.27"
    }
  }



  required_version = ">= 0.14.9"

}

# provider "aws" {
#   region                = var.aws_region
#   shared_credentials_file = "/home/User_Name/.aws/credentials"
#   profile               = "profile1"
# }

provider "aws" {
  region                = var.aws_region
  access_key = var.accessKey
  secret_key = var.secretKey
}