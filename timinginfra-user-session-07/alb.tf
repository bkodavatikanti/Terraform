module "app_alb" {
  source  = "terraform-aws-modules/alb/aws"
  name = var.app_alb_name
  load_balancer_type = "application"
  vpc_id             = local.vpc_id
  subnets = local.public_subnet_ids
  security_groups = [local.app_alb_security_group_id]
  create_security_group = false # c'z we have already created the above
  target_groups = [
    {
      name_prefix = "app-"  # we need to provide some prefix with meaningful name
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"  # for ecs / while using ecs we need to use ip address
      deregistration_delay   = 10
      health_check = {
        enabled             = true
        interval            = 15   #for every 15 secs will trigger this health check
        path                = "/health"  #app developer should configure this
        port                = "traffic-port"
        healthy_threshold   = 3  # if 3 conecutive healths check are success then it becomes  healthy
        unhealthy_threshold = 3
        timeout             = 6  # if we cant get any response from 6 seconds then it becoames unhealthy
        protocol            = "HTTP"
        matcher             = "200-399" # any response from this number are healthy
      }

    }
  ]

     http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
     {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
     },
  ]
  
  tags = merge(
    var.tags,
    var.app_alb_tags
  )
 
}