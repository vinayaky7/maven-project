resource "aws_instance" "testvm" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["${aws_security_group.radical-sg.id}"]
  subnet_id = "${aws_subnet.public_subnet_1.id}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "testvm"
  }

}

