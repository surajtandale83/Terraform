
variable "ami-id" {
    description = "test"
    type = string
    default = "ami-0c50b6f7dc3701ddd"
} 
  variable "type" {
     type = string
     default = "t2.nano"
} 
variable "key_name" {
    type = string
    default = "multicloud"
  
}

variable "tags_name" {
    type = string
    default = "dev"
}