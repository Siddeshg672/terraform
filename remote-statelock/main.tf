provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state-project1"
    }
}
