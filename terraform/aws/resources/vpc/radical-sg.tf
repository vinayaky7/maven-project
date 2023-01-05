resource "aws_security_group" "radical-sg" {
    name = "radical-sg"
    description = "Accept incoming connections."

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
}

    vpc_id = "${aws_vpc.radical-vpc.id}" 

    tags = {
    Name = "radical-sg"
    }
}