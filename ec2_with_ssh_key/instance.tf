locals {
  instance_type = "t2.micro"
}

data "aws_ami" "ami" {
  owners = [ "self" ]
  filter {
    name = "name"
    values = [ "*apache*" ]
  }
}

resource "tls_private_key" "tls_connector" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "access_key" {
  key_name = "akmaral-key"
  public_key = tls_private_key.tls_connector.public_key_openssh ##file("my-key-pair.pub")  или ssh-keygen -t rsa -b 2048 -f my-key-pair.pem

}

resource "local_file" "terraform_ec2_key_file" {
  content = tls_private_key.tls_connector.private_key_pem
  filename = "my-key-pair.pem"

  provisioner "local-exec" {
    command = "chmod 400 my-key-pair.pem"
  }
}


resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami.id
  instance_type = local.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.subnets["public_subnet"].id
  key_name = aws_key_pair.access_key.key_name
    tags = {
    Name = "akmaral_instance"
    owner = "akmaral"
  }

  # provisioner "local-exec" {
  #   command = "chmod 400  my-key-pair.pem"
  # }
}