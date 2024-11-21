data "aws_ami" "ami" {
  owners = [ "self" ]
  filter {
    name = "name"
    values = [ "*apache*" ]
  }
}


resource "aws_launch_configuration" "launch_configuration" {
    name_prefix = "launch_configuration"
    image_id = data.aws_ami.ami.id
    instance_type = var.instance_type

    security_groups = [ aws_security_group.sg1.id ]
    associate_public_ip_address = true
    user_data = file("data.sh")

    lifecycle {
      create_before_destroy = true
    }
}