resource "aws_instance" "terraform_instance" {
    ami = "ami-0c50b6f7dc3701ddd"
    instance_type = "t2.micro"
    key_name = "multicloud"
  
}

resource "aws_s3_bucket" "name" {
    bucket = "s3surajterraformbucket"
    
  
}