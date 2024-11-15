# Create a provider
provider "aws" {
    region = "us-east-1"
}


#Create ec2 
resource "aws_instance" "alibek" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "alibek_instance"
    owner = "akmaral"
  }
}