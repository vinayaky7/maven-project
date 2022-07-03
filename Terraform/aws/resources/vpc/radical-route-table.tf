resource "aws_route_table" "radical-route-table" {
    vpc_id = "${aws_vpc.radical-vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.radical-internet-gateway.id}"
    }
tags = {
        Name = "radical-route-table"
    }
}

resource "aws_main_route_table_association" "radical-route-table-association" {
    vpc_id         = "${aws_vpc.radical-vpc.id}"
    route_table_id = "${aws_route_table.radical-route-table.id}"
}