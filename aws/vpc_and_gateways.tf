resource "aws_vpc" "vpc" {
  cidr_block = "${var.network_address_space}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_eip" "nateip1" {
  vpc   = true
}

resource "aws_eip" "nateip2" {
  vpc   = true
}

# one NAT per AZ
resource "aws_nat_gateway" "natgw1" {
  allocation_id = "${aws_eip.nateip1.id}"
  subnet_id     = "${aws_subnet.public1.id}"

  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_nat_gateway" "natgw2" {
  allocation_id = "${aws_eip.nateip2.id}"
  subnet_id     = "${aws_subnet.public2.id}"

  depends_on = ["aws_internet_gateway.igw"]
}
