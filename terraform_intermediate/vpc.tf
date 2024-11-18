resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "maral_vpc"
    owner = "akmaral"
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "maral-igw"
    owner = "akmaral"
  }
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_block_public
    availability_zone = var.availability_zone_public
    tags = {
      Name = "maral_public_subnet"
      owner = "akmaral"
    }
    depends_on = [ aws_vpc.vpc ]
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_block_private
  availability_zone = var.availability_zone_private
  tags = {
    Name = "maral_public_subnet"
    owner = "akmaral"
  }
  depends_on = [ aws_vpc.vpc ]
}

# CREATE ROUTE TABLES AND ASSOCIATIONS (IN AWS ITS CREATED DEFAULT BY AWS IN THIS CASE WE MUST CREATE ROUTE TABLES AND ASSOCIOTIONS)

resource "aws_default_route_table" "internet_gateway_routable" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }
  tags = {
    Name = "default_routetb_maral"
    owner = "akmaral"
  }
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_route_table_association" "igw_rt_associotion" {
  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_default_route_table.internet_gateway_routable.id
 
  depends_on = [ aws_subnet.public_subnet ]
}