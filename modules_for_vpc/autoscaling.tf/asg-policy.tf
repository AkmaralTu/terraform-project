resource "aws_autoscaling_policy" "asg_policy_up" {
    name = var.asg_policy_up_name
    provider = aws
    autoscaling_group_name = aws_autoscaling_group.asg.name
    scaling_adjustment = 1
    cooldown = 300
    adjustment_type = "ChangeInCapacity"
}

resource "aws_autoscaling_policy" "asg_policy_down" {
    name = var.asg_policy_down_name
    provider = aws
    autoscaling_group_name = aws_autoscaling_group.asg.name
    scaling_adjustment = -1
    cooldown = 300
    adjustment_type = "ChangeInCapacity"
}


resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
    alarm_name = var.alarm_up_name
     provider = aws
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = 2
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/EC2"
    period                    = 120
    statistic                 = "Average"
    threshold                 = 70
    alarm_description         = "This metric monitors ec2 cpu utilization"

    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }
    alarm_actions = [ aws_autoscaling_policy.asg_policy_up.arn ]
}
resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down" {
    alarm_name = var.alarm_down_name
     provider = aws
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = 2
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/EC2"
    period                    = 120
    statistic                 = "Average"
    threshold                 = 30
    alarm_description         = "This metric monitors ec2 cpu utilization"
     dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }
    alarm_actions = [ aws_autoscaling_policy.asg_policy_down.arn ]
}