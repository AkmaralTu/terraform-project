data "aws_ami" "ami" {
  owners = [ "self" ]
  filter {
    name = "name"
    values = [ "*apache*" ]
  }
}

resource "tls_private_key" "tls_connection" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name = var.keys_name
  public_key = tls_private_key.tls_connection.public_key_openssh
}

resource "local_file" "maral_key_file" {
  content = tls_private_key.tls_connection.private_key_pem
  filename = var.file_name

  provisioner "local-exec" {
    command = "chmod 400 ${var.file_name}"
  }
}

resource "aws_instance" "instance" {
    provider = aws
    ami = data.aws_ami.ami.id
    instance_type = var.instance_type_of
    associate_public_ip_address = true
    vpc_security_group_ids = var.security_group_ids #sec group id
    subnet_id = var.public_subnet_id   #public subnet id
    user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl enable docker
              systemctl start docker
              docker pull strapi/strapi
              docker pull postgres
              docker network create strapi_network
              docker run --name strapi --network strapi_network -p 1337:1337 -d strapi/strapi
              docker run --name postgres --network strapi_network -e POSTGRES_PASSWORD=mysecretpassword -d postgres
              EOF

}

output "ami_id" {
  value = data.aws_ami.ami.id
}