resource "aws_autoscaling_group" "asg" {
    name = "${aws_launch_configuration.launch_configuration.name}-akmaral"  ##interpolation

    min_size = 1
    desired_capacity = 2
    max_size = 3

    launch_configuration = aws_launch_configuration.launch_configuration.name
}