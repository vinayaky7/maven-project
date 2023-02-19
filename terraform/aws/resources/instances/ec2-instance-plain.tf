resource "aws_instance" "testvm" {
  ami           = "ami-094125af156557ca2" # last parameter is the default value
  //ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["sg-05e6208821489e80a"]
  subnet_id = "subnet-07c10b20a7fb70b45"
  //subnet_id = lookup(var.subnets, var.subnet, "")
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "testvm"
  }

}

