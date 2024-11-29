resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "maral-igw"
  }
  depends_on = [ aws_vpc.vpc ]
}