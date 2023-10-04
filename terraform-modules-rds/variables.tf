variable "allocated_storage" {
  type = string

}

variable "db_name" {
  
}

variable "engine" {

}

variable "identifier" {

}

variable "engine_version" {
  
}


variable "username" {

}

variable "instance_type" {

}

variable "db_subnet_group_name" {

}


variable "vpc_security_group_ids" {
    type = list

}

# variable "secret_name" {
    
# }

variable "rds_secret_arn" {
    
}
variable "tags" {

}

variable "rds_tags" {
    default = {}

}