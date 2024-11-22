data "aws_ami" "ami" {
  owners = [ "self" ]
  filter {
    name = "name"
    values = [ "*apache*" ]
  }
}


resource "aws_launch_template" "launch_template" {
    name_prefix = "launch_template"
    image_id = data.aws_ami.ami.id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    
    # security_groups = [ aws_security_group.sg.id ]
    network_interfaces {
      associate_public_ip_address = true
    }
    user_data = base64encode(file("data.sh"))

    lifecycle {
      create_before_destroy = true
    }
}