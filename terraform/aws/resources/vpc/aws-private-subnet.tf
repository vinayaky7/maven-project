resource "aws_subnet" "aws-private-subnet" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = lookup(var.subnets, var.subnet_private, "")

tags = {
        Name = "radical-private-subnet"
    }
}