resource "aws_instance" "radical-bastion" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  vpc = "myvpc"
  key_name      = var.mykey
  vpc_security_group_ids = ["sg-0aefb3ada200c6a7a"]
  subnet_id = lookup(var.subnets, var.subnet, "")
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "radical-bastion"
  }
}

