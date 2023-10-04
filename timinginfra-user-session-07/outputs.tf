output "vpc_id" {
 value = module.vpc.vpc_id
}

output "security_group_id" {
  value = local.rds_security_group_id
}

output "ecs_cluster_id" {
  value = local.ecs_cluster_id
}

output "app_alb_security_group_id" {
  value = local.app_alb_security_group_id
}

output "app_alb_arn" {
  value = local.app_alb_arn
}
output "app_target_group_arns" {
  value = module.app_alb.target_group_arns
  
}