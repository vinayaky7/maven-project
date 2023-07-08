resource "aws_instance" "testvm" {
  ami           = "ami-0b029b1931b347543" # last parameter is the default value
  //ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["sg-0983b096a0db56db8"]
  subnet_id = "subnet-09d77de1900c2ff01"
  //subnet_id = lookup(var.subnets, var.subnet, "")
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "terraformcreated"
  }

}

