provider "aws" {
  region     = "${var.region}"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
}

resource "aws_vpc" "assess" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "demo"
  }
}

resource "aws_subnet" "assess_sub" {
  vpc_id     = "${aws_vpc.assess.id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "demo"
  }
}

resource "aws_internet_gateway" "assess_gw" {
  vpc_id = "${aws_vpc.assess.id}"

  tags = {
    Name = "demo"
  }
}

resource "aws_route_table" "assess_r" {
  vpc_id = "${aws_vpc.assess.id}"

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = "${aws_internet_gateway.assess_gw.id}"
  }
  tags = {
    Name = "demo"
  }
}
