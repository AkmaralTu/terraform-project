resource "aws_autoscaling_group" "asg" {
    name = "${aws_launch_template.launch_template.name}-akmaral"  ##interpolation

    min_size = 1
    desired_capacity = 2
    max_size = 3

    launch_template {
      id = aws_launch_template.launch_template.id
      version = "$Latest"
    }
    vpc_zone_identifier = [ aws_subnet.vpc_public_subnet.id ]
    force_delete = true
}