resource "aws_instance" "terraform_instance1" {
    ami = "ami-0c50b6f7dc3701ddd"
    instance_type = "t2.micro"
    key_name = "multicloud"
    tags = {
        Name = "Prod"
    }
  
}

resource "aws_instance" "terraform_instance2" {
    ami = "ami-0c50b6f7dc3701ddd"
    instance_type = "t2.nano"
    key_name = "multicloud"
    tags = {
        Name = "Test"
    }
  
}

