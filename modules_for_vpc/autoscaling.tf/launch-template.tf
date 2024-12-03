resource "aws_launch_template" "launch_template" {
  name = var.launch_template_name
  provider = aws
  image_id = var.ami_id
  instance_type = var.instance_type_launch_ec2
  # vpc_security_group_ids = [ var.security_group_id ]

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [ var.sg_group_id ]
    subnet_id = var.public_subnet_id_for_launch
  }
  # user_data = base64encode(file("modules_for_vpc/autoscaling.tf/data_asg.sh"))
  lifecycle {
    create_before_destroy = true
  }
}