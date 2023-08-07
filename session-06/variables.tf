variable "tags"{
  type = map
  default = {
    Name = "Timingsbh"
    Environment = "Dev"
    Terraform = "true"
  }
  
}

variable "igw_tags"{
   type = map
   default = {
    Name = "Timingsbh" #Dontrepeat resourename itself
    Environment = "Dev"
    Terraform = "true"
   }
}

variable "public_subnet_tags"{
  type = map
  default = {
    Name = "public_subnet_Timingsbh" # syntax: Resourcename_projectname
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "private_subnet_tags"{
  type = map
  default = {
    Name = "private_subnet_Timingsbh" # syntax: Resourcename_projectname
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "public_routetable_tags" {
    type = map
    default = {
      Name = "public_routetable_Timingsbh"
      Environment = "DEV"
      Terraform = "true"
    }
}

variable "nat_tags" {
    type = map
    default = {
      Name = "nat_timingsbh"
      Environment = "DEV"
      Terraform = "true"
    }
}

variable "private_routetable_tags" {
    type = map
    default = {
      Name = "private_routetable_Timingsbh"
      Environment = "DEV"
      Terraform = "true"
    }
}


variable "database_subnet_tags" {
    type = map
    default = {
      Name = "database_subnet_Timingsbh"
      Environment = "DEV"
      Terraform = "true"
    }
}