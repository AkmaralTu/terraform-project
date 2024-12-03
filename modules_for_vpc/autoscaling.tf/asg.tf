resource "aws_autoscaling_group" "asg" {
  name = var.asg_name
  provider = aws
  min_size = 1
  max_size = 3
  desired_capacity = 2

  launch_template {
    id = aws_launch_template.launch_template.id
    version = "$Latest"
  }
   vpc_zone_identifier = [ var.public_subnet_id ]
  force_delete = true
  
  
}