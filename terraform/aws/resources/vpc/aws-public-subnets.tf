resource "aws_subnet" "public_subnet_1" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "${var.subnet_public-1}"
    map_public_ip_on_launch = true

tags = {
        Name = "radical-public-subnet-1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${var.subnet_public-2}"
    map_public_ip_on_launch = true

tags = {
        Name = "radical-public-subnet-2"
    }
}

resource "aws_subnet" "public_subnet_3" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${var.subnet_public-3}"
    map_public_ip_on_launch = true

tags = {
        Name = "radical-public-subnet-3"
    }
}

resource "aws_subnet" "public_subnet_4" {
    vpc_id = "${aws_vpc.radical-vpc.id}" 
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${var.subnet_public-4}"
    map_public_ip_on_launch = true

tags = {
        Name = "radical-public-subnet-4"
    }
}


