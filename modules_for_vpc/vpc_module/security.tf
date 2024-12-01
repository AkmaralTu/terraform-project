resource "aws_security_group" "sg" {
  name = "allow_ssh_and_https"
  description = "Allow SSH and Https"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "Allow ssh"
    from_port = "22"
    to_port = "22"
    cidr_blocks = [ "0.0.0.0/0"]
    protocol = "tcp"
  }

    ingress {
    description = "Allow http"
    from_port = "80"
    to_port = "80"
    cidr_blocks = [ "0.0.0.0/0"]
    protocol = "tcp"
  }

    ingress {
    description = "Allow https"
    from_port = "443"
    to_port = "443"
    cidr_blocks = [ "0.0.0.0/0"]
    protocol = "tcp"
  }

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "-1"
  }

    tags = {
    Name = "maral_security_group"
    owner = "akmaral"
  }
}

output "security_group_id" {
  value = aws_security_group.sg.id
}