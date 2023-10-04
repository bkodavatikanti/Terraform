variable "security_group_name" {  #user must provide
  type = string
}

variable "security_group_description" {  #user must provide
  type = string
  
}

variable "tags"{  #user must provide
  type = map

}

variable "security_group_tags"{
    type = map
    default = {}  #it is optional for user to provide hence we provide default = {} as empty
}


variable "vpc_id" {
 type = string
}


# variable "ingress_cidr" {    
#     type = list(map(string))
#     default = [
#         {
#           from_port = "80"
#           to_port = "80"
#           cidr_block = "0.0.0.0/0"
#           description = "enabling to access 80 from internet"

#     },
#     {
#           from_port = "443"
#           to_port = "443"
#           cidr_block = "0.0.0.0/0"
#           description = "enabling to access 80 from internet"

#     }
#     ]


   variable "ingress_cidr" {    
     type = list(map(string))
     default = []

}
