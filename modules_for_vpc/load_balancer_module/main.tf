resource "aws_lb" "load_balancer" {
    name = "load-balancer-maral"
    provider = aws
#   internal = false
    load_balancer_type = "application"
    security_groups =  var.security_group_id_for_lb 
    subnets = var.public_subnets_id_for_lb
    enable_deletion_protection = false
#     access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Environment = "production"
  }
}

# Создание группы целей для us-east-1
resource "aws_lb_target_group" "target_for_lb" {
  name     = var.targetname
  provider = aws
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/health"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Создание слушателя для балансировщика нагрузки
resource "aws_lb_listener" "listener_for_lb" {
  load_balancer_arn = aws_lb.load_balancer.arn
  provider = aws
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      content_type = "text/plain"
      message_body = "Dont worry, you are here. This site really works"
    }
  }
} 

resource "aws_route53_zone" "main" {
  name = "maralweb.online"  # Имя вашего домена
  
}

resource "aws_route53_record" "strapi_latency" {
  zone_id = aws_route53_zone.main.id
  provider = aws
  name    = "strapi.${var.name_region}.maralweb.online"
  type    = "A"   

  alias {
    name                   = aws_lb.load_balancer.dns_name  # Имя балансировщика нагрузки для региона us-east-1
    zone_id                = aws_lb.load_balancer.zone_id # ID зоны балансировщика нагрузки
    evaluate_target_health = true  # Оценка состояния целевых ресурсов
  }

}

