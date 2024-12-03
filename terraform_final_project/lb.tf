module "lb_for_us" {
  source = "../modules_for_vpc/load_balancer_module"
  providers = {
    aws=aws
  }
  security_group_id_for_lb = [module.vpc_for_us.security_group_id]
  public_subnets_id_for_lb =  module.vpc_for_us.public_subnet_ids
  targetname = "target-for-us"
  vpc_id = module.vpc_for_us.vpc_id
  name_region = "us"
}

module "lb_for_asia" {
  source = "../modules_for_vpc/load_balancer_module"
  providers = {
    aws=aws.asia
  }
  security_group_id_for_lb = [module.vpc_for_asia.security_group_id]
  public_subnets_id_for_lb = module.vpc_for_asia.public_subnet_ids
  targetname = "target-for-asia"
  vpc_id = module.vpc_for_asia.vpc_id
  name_region = "asia"
}

module "lb_for_europe" {
  source = "../modules_for_vpc/load_balancer_module"
  providers = {
    aws=aws.europe
  }
  security_group_id_for_lb = [module.vpc_for_europe.security_group_id]
  public_subnets_id_for_lb = module.vpc_for_europe.public_subnet_ids
  targetname = "target-for-europe"
  vpc_id = module.vpc_for_europe.vpc_id
  name_region = "europe"
}