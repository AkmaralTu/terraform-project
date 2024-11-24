
data "aws_ami" "ami" {
  owners = [ "self" ]
  filter {
    name = "name"
    values = [ "*apache*" ]
  }
}



resource "aws_instance" "akmaral_ins_resource" {
  ami = data.aws_ami.ami.id
  instance_type = "t2.micro"
  tags = {
    Name = "maral_instance-1"
    
  }
}