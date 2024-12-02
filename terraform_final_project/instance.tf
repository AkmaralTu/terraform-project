locals {
  instance_type = "t2.micro"
}

module "ec2_us" {
  source = "../modules_for_vpc/ec2_module"
  providers = {
    aws = aws
  }
  instance_type_of = local.instance_type
  public_subnet_id = module.vpc_for_us.public_subnet_id
  security_group_ids = [module.vpc_for_us.security_group_id]
  keys_name = "us-key"
  file_name = "us-key.pem"
  depends_on = [ module.vpc_for_us ]
}
module "ec2_asia" {
  source = "../modules_for_vpc/ec2_module"
  providers = {
    aws = aws.asia
  }
  instance_type_of = local.instance_type
  public_subnet_id = module.vpc_for_asia.public_subnet_id
  security_group_ids = [module.vpc_for_asia.security_group_id]
  keys_name = "asia-key"
  file_name = "asia-key.pem"
  depends_on = [module.vpc_for_asia]
}

module "ec2_europe" {
  source = "../modules_for_vpc/ec2_module"
  providers = {
    aws = aws.europe
  }
  instance_type_of = local.instance_type
  public_subnet_id = module.vpc_for_europe.public_subnet_id
  security_group_ids = [module.vpc_for_europe.security_group_id]
  keys_name = "europe-key"
  file_name = "europe-key.pem"
  depends_on = [ module.vpc_for_europe ]
}
