provider "aws" {
  region = "us-east-1"
}

locals {
  instance_type  = "t2.micro"
}

resource "random_pet" "s3_bucket_name" {
  length = 3
  separator = "-"
}

resource "aws_s3_bucket" "bucket_with_randomname" {
  bucket = "example-${random_pet.s3_bucket_name.id}"
  tags = {
    Name = "${random_pet.s3_bucket_name.id}"
  }
}

resource "random_id" "unique_name" {
  byte_length = 5
}
data "aws_ami" "ami" {
  owners = [ "self" ]
  filter {
    name = "name"
    values = [ "*apache*" ]
  }
}

resource "aws_instance" "ec2_with_uniquename" {
    ami = data.aws_ami.ami.id
    instance_type = local.instance_type
    tags = {
      Name = random_id.unique_name.hex
    }

}
output "instance_name" {
  value = aws_instance.ec2_with_uniquename.tags
} 
output "s3_bucket" {
  value = aws_s3_bucket.bucket_with_randomname.bucket
}