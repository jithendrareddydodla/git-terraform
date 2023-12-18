provider "aws" {}

# variable "my-public-key-location" {}


data "aws_security_group" "existing_sg" {
  vpc_id      = "vpc-027f936ee580222ed"
  name        = "JithendraSECGRP"
}

# resource "aws_key_pair" "JithendraAuto" {
#   key_name = "JithendraAuto"
#   public_key = file(var.my-public-key-location)
# }

resource "aws_instance" "web" {
    
    ami             = "ami-0d92749d46e71c34c"
    instance_type   = "t2.micro"
    key_name        = "JithendraD"
    subnet_id       = "subnet-097b7d72fad7e20b1"
    vpc_security_group_ids = [ data.aws_security_group.existing_sg.id ]
    associate_public_ip_address = "true"
    # user_data       = file("jenkins.sh")

    tags = {
        Name = "Linux"
  }
}