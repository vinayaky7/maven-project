resource "aws_internet_gateway" "radical-internet-gateway" {
    vpc_id = "${aws_vpc.radical-vpc.id}"
}
