#Create a new VPC with natgatway and private
resource "aws_vpc" "MyVPC" {
    cidr_block = "10.0.0.0/16"
    tags ={
    Name = "MyVPC"
    }
}

resource "aws_subnet" "mypublicsubnet" { #Publ;ic subnet1
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-southeast-2a"
    tags = {
      Name = "mypublicsubnet"
          }

}
resource "aws_subnet" "mypublicsubbnet2" { #Publ;ic subnet2
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-2b"
    tags = {
      Name = "mypublicsubnet2"
    }
}   
resource "aws_subnet" "myprivatesubnet" { # Private Subnet1
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-southeast-2c"
      tags = {
    Name = "MyPrivateSubnets"
    }
  }

  resource "aws_subnet" "name" { # Private Subnet2
    vpc_id =aws_vpc.MyVPC.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-southeast-2d"
    tags ={
    Name = "MyPrivateSubnets2"
    }
}
  
 resource "aws_route_table" "MyPublicRouteTable" {
    vpc_id = aws_vpc.MyVPC.id
    tags = {
        Name = "MyPublicRouteTable"     
    }
 }
 resource "aws" "name" {
   
 }


  
