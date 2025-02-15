resource "aws_instance" "name" {
    ami = var.ami-id
    instance_type = var.type
    key_name = var.key_name
    tags = {
        Name = var.tags_name
    }
    
}