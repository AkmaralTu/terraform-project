provider "aws" {
    region = "us-east-1"
}

# locals {
#   vpc_cidr_block = "10.0.0.0/16"
#   subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]
#   subnets_availability_zones = ["us-east-1a", "us-east-1b"]

# }

# resource "aws_vpc" "vpc" {
#     cidr_block = local.vpc_cidr_block
#     enable_dns_support = true
#     enable_dns_hostnames = true
#     tags = {
#     Name = "maral-vpc"
#     env = "dev"
#   }
# }

# resource "aws_subnet" "subnets_for_vpc" {
#     count = length(local.subnets_cidr_block)
#     vpc_id = aws_vpc.vpc.id
#     cidr_block = local.subnets_cidr_block[count.index]
#     availability_zone = local.subnets_availability_zones[count.index]
#     tags = {
#         Name = "subnet_${count.index+1}"
#     }

# }

locals {
  vpc = {
    cidr_block = "10.0.0.0/16"
  }
  subnets = {
    subnet_1 = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
    }
       subnet_2 = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
    }
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = local.vpc.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "maral-vpc"
  }
}

resource "aws_subnet" "subnets" {
    vpc_id = aws_vpc.vpc.id
    for_each = local.subnets
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    tags = {
      Name = "subnet-${each.key}"
    }

}