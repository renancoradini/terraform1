#Alterar as variaveis para acessar a aws
variable "accessKey" {
  type = string
  description = "acess key statica"
  default   = "AKIAVXXMOHS3FRM3GRGR"
}

variable "secretKey" {
  type = string
  description = "Secret key statica"
  default   = "m0ZSNm7LmfVykPXKavL/RZptoxB4EdViIIc4g1QI"
}
#
#
#
variable "aws_region" {
  description = "The AWS region to create the VPC in."
  default   = "us-east-1"
}


variable "vpc-cidr" {
cidr_block = "172.168.0.0/16"
}

variable "prisub1cidr" {
cidr_block = "172.168.1.0/24"
}

variable "prisub2cidr" {
cidr_block = "172.168.2.0/24"
}

variable "prisub3cidr" {
cidr_block = "172.168.3.0/24"
}

