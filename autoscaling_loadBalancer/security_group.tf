resource "aws_security_group" "sg" {
  name = "sg"
  description = "allow http,https and ssh"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "allow http"
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  
  ingress {
    description = "allow https"
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    description = "allow ssh"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  
  tags = {
    Name = "maral-sg"
    Owner = "maral"
  }
  
}