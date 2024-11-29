locals {
  subnets = {
    public_subnet = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        internet_access = "true"
    }
    private_subnet = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
        internet_access = "false"
    }
  }
}
resource "aws_subnet" "subnets" {
  vpc_id = aws_vpc.vpc.id
  for_each = local.subnets
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = each.value.internet_access
  depends_on = [ aws_vpc.vpc ]
}
resource "aws_default_route_table" "igw_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "routetable-maral"
  }
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_route_table_association" "igw_and_rt" {
  # for_each = {
  #   for key, value in local.subnets : key => value
  #   if value.internet_access == "true"
  # }
  subnet_id = aws_subnet.subnets["public_subnet"].id
  route_table_id = aws_default_route_table.igw_route_table.id
  depends_on = [ aws_subnet.subnets ]

}