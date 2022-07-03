resource "aws_vpc" "radical-vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true

tags = {
        Name = "radical-vpc"
    }
}