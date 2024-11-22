resource "aws_autoscaling_policy" "asg_policy_up" {
  name = "asg_policy_up"
  scaling_adjustment = 1 #e number of members by which to scale, when the adjustment bounds are breached.
  adjustment_type = "ChangeInCapacity"
  cooldown = 300 #The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start.
  autoscaling_group_name = aws_autoscaling_group.asg.name

}

resource "aws_autoscaling_policy" "asg_policy_down" {
  name = "asg_policy_down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
  alarm_name = "cpu_alarm_name_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"  #threshold=30 yfxbn 70%=< autoscaling  LessThanOrEqualToThreshold
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 70
  alarm_description         = "This metric monitors ec2 cpu utilization"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  alarm_actions     = [aws_autoscaling_policy.asg_policy_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down" {
  alarm_name = "cpu_alarm_name_down"
  comparison_operator = "LessThanOrEqualToThreshold"  #threshold=30 yfxbn 30%=< autoscaling  
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 30
  alarm_description         = "This metric monitors ec2 cpu utilization"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  alarm_actions     = [aws_autoscaling_policy.asg_policy_down.arn]
}