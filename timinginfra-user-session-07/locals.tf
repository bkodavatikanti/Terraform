locals {
 
 #lookup will cocanitate (add two string ) ex here - it will get the name from the tags and separated by s%-s% timingsbh-public
 public_route_table_name = format("%s-%s", lookup (var.tags,"Name"), "public")
 private_route_table_name = format("%s-%s", lookup (var.tags,"Name"), "private")
 database_route_table_name = format("%s-%s", lookup (var.tags,"Name"), "database")
 #the advanatages of locals is you can write some functions and calculate the values at runtime where in variables we cant.
 vpc_id = module.vpc.vpc_id
 rds_security_group_id = module.rds_sg.security_group_id
 db_subnet_group_name = module.vpc.db_subnet_group_name
 ecs_cluster_id = module.ecs_cluster.ecs_cluster_id
 #app_alb_security_group_id = module.app_alb_sg.security_group_id
 app_alb_security_group_id = module.app_alb_sg.security_group_id
 private_subnet_ids = module.vpc.private_subnet_ids
 app_alb_arn = module.app_alb.lb_arn
 public_subnet_ids = module.vpc.public_subnet_ids
 rds_endpoint = module.rds.rds_endpoint
 api_alb_dns_name = module.app_alb.lb_dns_name
 api_alb_zone_id = module.app_alb.lb_zone_id
}

