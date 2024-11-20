data "aws_ami" "ami" {
  owners = ["self"]
  filter {
    name = "name"
    values = [ "**apache" ]
  }
}


resource "aws_key_pair" "access_key" {
  key_name = "akmaral-key"
  public_key = file(var.key_pair)
}


resource "aws_instance" "akmaral_resource_for_instance" {
  ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  associate_public_ip_address = true
  key_name = aws_key_pair.access_key.key_name 
  vpc_security_group_ids = [ aws_security_group.allow_ssh_and_http.id ]
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "akmaral_instance"
    owner = "akmaral"
  }
}