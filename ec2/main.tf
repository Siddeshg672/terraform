provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}
resource "aws_instance" "webserver" {
    ami             = "ami-0b8b44ec9a8f90422"
    instance_type   = "t2.micro"
    tags = {
        Name        = "webserver"
        Description = "an nginx webserve on ubuntu"
    }
    key_name = aws_key_pair.web.id
    vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
}
resource "aws_key_pair" "web" {
    public_key = file("/home/ubuntu/.ssh/id_rsa.pub")
}
resource "aws_security_group" "ssh-access" {
    name        = "ssh-access"
    description = "Allow ssh accesss from internet"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["172.168.1.0/32"]
    }
}
output publicip {
    value           = aws_instance.webserver.public_ip
}
