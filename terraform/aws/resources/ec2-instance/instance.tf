resource "aws_instance" "radical-bastion" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["sg-033eb4f820faea3b3"]
  subnet_id = lookup(var.subnets, var.subnet, "")
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "radical-bastion"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  
}

