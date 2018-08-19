resource "aws_route_table" "private1" {
  vpc_id           = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.natgw1.id}"
  }
}

resource "aws_route_table" "private2" {
  vpc_id           = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.natgw2.id}"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.private_subnet1_address_space}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = "false"
}

resource "aws_subnet" "private2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.private_subnet2_address_space}"
  availability_zone = "${data.aws_availability_zones.available.names[2]}"
  map_public_ip_on_launch = "false"
}


resource "aws_route_table_association" "private1" {
  subnet_id      = "${aws_subnet.private1}"
  route_table_id = "${aws_route_table.private1.id}"
}

resource "aws_route_table_association" "private2" {
  subnet_id      = "${aws_subnet.private2}"
  route_table_id = "${aws_route_table.private2.id}"
}
