provider "aws" {
  region     = "${var.AWS_REGION}"
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

resource "aws_instance" "assess-instance" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami,var.AWS_REGION)}"
  instance_type = "${var.instance_type}"

resource "aws_vpn_gateway" "assess_vpn" {
  vpc_id = "${aws_vpc.assess.id}"
}

resource "aws_customer_gateway" "assess_cust_gw" {
  bgp_asn    = 65000
  ip_address = "172.0.0.1"
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "assess_vpn_con" {
  vpn_gateway_id      = "${aws_vpn_gateway.assess_vpn.id}"
  customer_gateway_id = "${aws_customer_gateway.assess_cust_gw.id}"
  type                = "ipsec.1"
  static_routes_only  = true
}