resource "aws_subnet" "subnet1" {  
   vpc_id =  aws_vpc.my-vpc.id
   cidr_block = var.prisub1cidr
 }

resource "aws_subnet" "subnet2" {  
   vpc_id =  aws_vpc.my-vpc.id
   cidr_block = var.prisub2cidr
 }

 resource "aws_subnet" "subnet3" {  
   vpc_id =  aws_vpc.my-vpc.id
   cidr_block = var.prisub3cidr
 }