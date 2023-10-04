

#this aws parameter store is used to store the values on aws from the 
#aws resources which will help to use in the application development and devops engineers \
#while working on the application configuration
resource "aws_ssm_parameter" "vpc_id" {
  name  = "/timing/vpc/vpc_id"   # we should provide some meaninful path name to store
  type  = "String"
  value = module.vpc.vpc_id #or we can use value = local.vpc_id
}

resource "aws_ssm_parameter" "private_subnets" {
  name  = "/timing/vpc/private_subnet_ids"  
  type  = "String"
  value = join (",",module.vpc.private_subnet_ids) # or we can use local reference  # to join the output of 2 subnets strings with, separete
}


resource "aws_ssm_parameter" "public_subnets" {
  name  = "/timing/vpc/public_subnet_ids"  
  type  = "String"
  value = join (",",module.vpc.public_subnet_ids) # or we can use local reference  # to join the output of 2 subnets strings with, separete
}


resource "aws_ssm_parameter" "app_alb_security_group_id" {
  name = "/timing/vpc/app_alb_security_group_id"  
  type  = "String"
 value = local.app_alb_security_group_id #or we can use the below way also 
 #value = module.app_alb_sg.security_group_id
}


resource "aws_ssm_parameter" "rds_security_group_id" {
  name  = "/timing/vpc/rds_security_group_id"  
  type  = "String"
  value = local.rds_security_group_id 
}

resource "aws_ssm_parameter" "rds_endpoint" {
  name  = "/timing/vpc/rds_endpoint"  
  type  = "String"
  value = module.rds.rds_endpoint
}

resource "aws_ssm_parameter" "app_target_group_arn" {
  name  = "/timing/ec2/app_target_group_arns"  
  type  = "StringList"
  value = join(",", module.app_alb.target_group_arns)
}

resource "aws_ssm_parameter" "rds_secret_arn" {
  name  = "/timing/rds/rds_secret_arn"  
  type  = "String"
  value =var.rds_secret_arn
}