# Creating RT for Public Subnet
 resource "aws_route_table" "publRT" {
  vpc_id =  aws_vpc.my-vpc.id
     route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
     }
 }
#Associating the Public RT with the Public Subnets
resource "aws_route_table_association" "PubRTAss1" {
subnet_id = aws_subnet.subnet1.id
route_table_id = aws_route_table.publRT.id
}

resource "aws_route_table_association" "PubRTAss2" {
subnet_id = aws_subnet.subnet2.id
route_table_id = aws_route_table.publRT.id
}

resource "aws_route_table_association" "PubRTAss3" {
subnet_id = aws_subnet.subnet3.id
route_table_id = aws_route_table.publRT.id
}



# Creating RT for Private Subnet
#  resource "aws_route_table" "privRT" {    
#  vpc_id = aws_vpc.my-vpc.id
#    route {
#    cidr_block = "0.0.0.0/0"            
#    nat_gateway_id = aws_nat_gateway.NAT-GW.id
#    }
#  }