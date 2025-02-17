#Crerate New VPC with Terraform
resource "aws_vpc" "VPC_with_terraform" 
{
    cidr_blocks = "10.0.0.0/16"
    tags = {
        Name ="my-vpc_terraform"
    }
  
}
#Create subnet in VPC with Terraform
resource ="subnet" "sunbent_with_terraform"{
    vpc_id = aws_vpc.VPC_with_terraform.id
    cidr_blocks = "10.0.0.0/16"
    tags
    }
   
 