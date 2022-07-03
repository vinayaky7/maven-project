resource "aws_subnet" "aws-private-subnet" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us-west-2b"

tags = {
        Name = "radical-private-subnet"
    }
}