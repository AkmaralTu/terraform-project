resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "maral_rt"
    owner = "maral"
  }
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_route_table_association" "rt_associotion" {
  subnet_id = aws_subnet.vpc_public_subnet.id
  route_table_id = aws_default_route_table.route_table.id
  depends_on = [ aws_subnet.vpc_public_subnet ]
}