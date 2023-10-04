variable "vpc_cidr" {
  type = string #we are not giving any default here. user must provide this
}

variable "tags" { #we are not giving any default here. user must provide this
  type = map 
}

variable "vpc_tags"{
 type = map
 default = {} # this is optional
}

variable "azs" {
 type = list
}

variable "public_subnet_cidr" {
 type = list
}

variable "public_subnet_names" {
  type = list
}
variable "public_subnet_tags" {   
  type = map
  default = {}                       # when the variable is optional and user must give we should put default = {}
}

variable  "igw_tags" {
  type = map
  default = {}
}

variable "public_route_table_tags" {
  type = map
  default = {}                       #optional thats why we put default{}
}

variable "public_route_table_name" {
    type = string
}

variable "private_subnet_cidr" {
    type = list
}

variable "private_subnet_tags" {
    type = map
    default = {}
}

variable "private_subnet_names" {
    type = list
}

variable "private_route_table_tags" {
    type = map
    default = {}   # this is optional
}

variable "private_route_table_name" {
    type = string
  
}

variable "database_subnet_cidr" {
    type = list
}

variable "database_subnet_tags" {
    type = map
    default = {}
}

variable "database_subnet_names" {
    type = list

}

 variable "database_route_table_name" {

}
variable "database_route_table_tags" { 
    type = map
    default = {}
}

variable "database_subnet_group_tags"{
  type = map
  default = {}

}