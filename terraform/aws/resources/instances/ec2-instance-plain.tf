resource "aws_instance" "testvm" {
  ami           = "ami-0cea098ed2ac54925" # last parameter is the default value
  //ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["sg-033eb4f820faea3b3"]
  subnet_id = "subnet-0f4c6ea0f186845c3"
  //subnet_id = lookup(var.subnets, var.subnet, "")
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "testvm"
  }

}

