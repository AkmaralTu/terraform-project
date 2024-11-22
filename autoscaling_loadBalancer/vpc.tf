resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "maral_vpc"
    owner = "maral"
  }
  
}