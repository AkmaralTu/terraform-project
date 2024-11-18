# # Create a provider
# provider "aws" {
#     region = "us-east-1"
# }

data "aws_ami" "aws-amazon-linux" {
  owners = ["self"]
  filter {
    name = "name"
    values = ["*apache*"]
  }
}


#Create ec2 
resource "aws_instance" "alibek" {
  ami = data.aws_ami.aws-amazon-linux.id
  instance_type = var.instance_type
  associate_public_ip_address = true
  tags = {
    Name = "alibek_instance"
    owner = "akmaral"
  }
}