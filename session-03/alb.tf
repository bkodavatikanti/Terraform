resource "aws_lb" "alb" {
  name               = var.name
  internal           = var.internet
  load_balancer_type = var.lb_type
  security_groups    = var.security_groups
  idle_timeout = var.timeout
  enable_deletion_protection = true

  # access_logs {
  #   bucket  = "my-logs"
  #   prefix  = "my-app-lb"
  #   enabled = true
  # }

  subnets = var.subnet_ids

  tags = {
    Environment = "production"
  }

}