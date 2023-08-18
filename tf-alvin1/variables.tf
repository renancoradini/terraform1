#Alterar as variaveis para acessar a aws
variable "accessKey" {
  type = string
  description = "acess key statica"
  default   = "AKIAVXXMOHS3FRM3GRGR"
}

variable "secretKey" {
  type = string
  description = "Secret key statica"
  default   = "m0ZSNm7LmfVykPXKavL/RZptoxB4EdViIssIc4g1QI"
}
#
#
variable "aws_region" {
  description = "The AWS region to create the VPC in."
  default   = "us-east-1"
}

variable "vpc-cidr" {
type = string
default = "172.168.0.0/16"
}

variable "prisub1cidr" {
default = "172.168.1.0/24"
}

variable "prisub2cidr" {
default = "172.168.2.0/24"
}

variable "prisub3cidr" {
default ="172.168.3.0/24"
}

