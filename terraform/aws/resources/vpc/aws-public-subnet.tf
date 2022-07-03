resource "aws_subnet" "aws-public-subnet" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = lookup(var.subnets, var.subnet_public, "")
    map_public_ip_on_launch = true

tags = {
        Name = "radical-public-subnet"
    }
}