module "autoscaling_for_us" {
  source = "../modules_for_vpc/autoscaling.tf"
  providers = {
    aws = aws
  }
  asg_name = "us-asg"
  security_group_id = module.vpc_for_us.security_group_id
  public_subnet_id = module.vpc_for_us.public_subnet_id
  asg_policy_down_name = "asg-policy-down-us"
  asg_policy_up_name = "asg-poiicy-up-us"
  launch_template_name = "launch-teplate-us"
  instance_type_launch_ec2 = "t2.micro"
  ami_id = module.ec2_us.ami_id
  public_subnet_id_for_launch = module.vpc_for_us.public_subnet_id
  alarm_down_name = "alarm-down-us"
  alarm_up_name = "alarm-up-us"
  sg_group_id = module.vpc_for_us.security_group_id
  depends_on = [ module.vpc_for_us ]
}
module "autoscaling_for_asia" {
  source = "../modules_for_vpc/autoscaling.tf"
  providers = {
    aws = aws.asia
  }
  asg_name = "asia-asg"
  security_group_id = module.vpc_for_asia.security_group_id
  public_subnet_id = module.vpc_for_asia.public_subnet_id
  asg_policy_down_name = "asg-policy-down-asia"
  asg_policy_up_name = "asg-poiicy-up-asia"
  launch_template_name = "launch-teplate-asia"
  instance_type_launch_ec2 = "t2.micro"
  ami_id = module.ec2_asia.ami_id
  public_subnet_id_for_launch = module.vpc_for_asia.public_subnet_id
  alarm_down_name = "alarm-down-asia"
  alarm_up_name = "alarm-up-asia"
  sg_group_id = module.vpc_for_asia.security_group_id
  depends_on = [ module.vpc_for_asia ]
}
module "autoscaling_for_europe" {
  source = "../modules_for_vpc/autoscaling.tf"
  providers = {
    aws = aws.europe
  }
  asg_name = "europe-asg"
  security_group_id = module.vpc_for_europe.security_group_id
  public_subnet_id = module.vpc_for_europe.public_subnet_id
  asg_policy_down_name = "asg-policy-down-europe"
  asg_policy_up_name = "asg-poiicy-up-europe"
  launch_template_name = "launch-teplate-europe"
  instance_type_launch_ec2 = "t2.micro"
  ami_id = module.ec2_europe.ami_id
  public_subnet_id_for_launch = module.vpc_for_europe.public_subnet_id
  alarm_down_name = "alarm-down-europe"
  alarm_up_name = "alarm-up-europe"
  sg_group_id = module.vpc_for_europe.security_group_id
  depends_on = [ module.vpc_for_europe ]
}