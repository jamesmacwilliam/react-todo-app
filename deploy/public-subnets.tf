resource "aws_route_table" "public1" {
  vpc_id           = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table" "public2" {
  vpc_id           = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.public_subnet1_address_space}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "public2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.public_subnet2_address_space}"
  availability_zone = "${data.aws_availability_zones.available.names[2]}"
  map_public_ip_on_launch = "true"
}


resource "aws_route_table_association" "public1" {
  subnet_id      = "${aws_subnet.public1}"
  route_table_id = "${aws_route_table.public1.id}"
}

resource "aws_route_table_association" "public2" {
  subnet_id      = "${aws_subnet.public2}"
  route_table_id = "${aws_route_table.public2.id}"
}
