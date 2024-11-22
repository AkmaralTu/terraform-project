resource "aws_subnet" "vpc_public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_block_public_subnet
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone_public_subnet
    tags = {
        Name = "maral_public_subnet"
        owner = "maral"
    }
    depends_on = [ aws_vpc.vpc ]
}   

resource "aws_subnet" "vpc_private_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_block_private_subnet
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone_private_subnet
    tags = {
        Name = "maral_private_subnet"
        owner = "maral"
    }
    depends_on = [ aws_vpc.vpc ]
}   