#createing VPC
resource "aws_vpc" "production" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Production VPC"
    }
}

#creating subnets
resource "aws_subnet" "production_a" {
    vpc_id = aws_vpc.production.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-southeast-2a"
    tags = {
        Name = "Production Subnet A"
    }

}

  
#creating internet gateway
resource "aws_internet_gateway" "production" {
    vpc_id = aws_vpc.production.id
    tags = {
        Name = "Production Internet Gateway"
    }
}

#creating route table
resource "aws_route_table" "production" {
    vpc_id = aws_vpc.production.id
    tags = {
        Name = "Production Route Table"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.production.id
    }
}

#associating route table with subnet
resource "aws_route_table_association" "production_a" {
    route_table_id = aws_route_table.production.id
    subnet_id      = aws_subnet.production_a.id
}

#creating security group
resource "aws_security_group" "production" {
    vpc_id = aws_vpc.production.id
    name   = "Production Security Group"
    description = "Production security group"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Production Security Group"
    }
}

#creating EC2 instance
resource "aws_instance" "production" {
    ami           = "ami-0b0a3a2350a9877be"
    instance_type = "t2.micro"
    key_name     = "aus"
    vpc_security_group_ids = [aws_security_group.production.id]
    subnet_id        = aws_subnet.production_a.id

    tags = {
        Name = "Production EC2 Instance"
    }
}
