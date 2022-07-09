resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "mysubnet-public-1" {
    vpc_id = "vpc-09ea0248cd881161b"
    cidr_block = "192.168.1.0/24"
}

resource "aws_instance" "radical-bastion" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["sg-033eb4f820faea3b3"]
  subnet_id = "aws_subnet.mysubnet-public-1.id"
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "radical-bastion"
  }
}

