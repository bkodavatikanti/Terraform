#variables.tf is to declare the variable. (you can keep default values here but not recomended)
#terraform.tfvars is to provide the default values to variables.

variable "cidr" { #declaring name
  type = string     #declaring type
  #default = "10.0.0.0/16"
  
}

variable "public_subnet_cidr" {
 type = string
  
}

variable "private_subnet_cidr" {
 type = string
  
}

 variable "tags"  {
    type = map
  }

  variable "internet-cidr" {
    type = string
    description = "optional"
    
  }

  variable "name" {
    type = string
  }

  variable "internet" {
    type = bool

  }

  variable "lb_type" {
    type = string
    
  }
  
  variable "subnet_ids" {
    type = list
  }

  variable "security_groups" {
    type = list
    
  }

  variable "timeout" {
    type = number
    
  }
