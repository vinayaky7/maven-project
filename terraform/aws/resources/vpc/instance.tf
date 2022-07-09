resource "aws_instance" "radical-bastion" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  vpc_security_group_ids = ["${aws_security_group.radical-sg.id}"]
  subnet_id = "${aws_subnet.aws-public-subnet.id}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "radical-bastion"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }

  # Login to the ec2-user with the aws key.
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    private_key = "${file("${var.keyPath}")}"
    host        = self.public_ip
  }
  
}

