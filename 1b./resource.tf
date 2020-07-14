resource "aws_vpc" "assess" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "demo"
  }
}

resource "aws_subnet" "assess_sub" {
  vpc_id     = aws_vpc.assess.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "demo"
  }
}

resource "aws_instance" "assess-inst" {
  count         = var.instance_count
  ami           = lookup(var.ami,var.AWS_REGION)
  instance_type = var.instance_type
  subnet_id = aws_subnet.assess_sub.id
  tags = {
    Name = "test-demo"
  }
}
resource "aws_vpn_gateway" "assess_vpn" {
  vpc_id = aws_vpc.assess.id
}

resource "aws_customer_gateway" "assess_cust_gw" {
  bgp_asn    = 65000
  ip_address = "172.0.0.1"
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "assess_vpn_con" {
  vpn_gateway_id      = aws_vpn_gateway.assess_vpn.id
  customer_gateway_id = aws_customer_gateway.assess_cust_gw.id
  type                = "ipsec.1"
  static_routes_only  = true
}
