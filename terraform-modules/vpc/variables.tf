# variable "cidr" {
#   type = string
#   default = "10.0.0.0/16"
# }

variable "tags" {
  type = map
  default = {
    Name = "vpcbh"
  }
}

variable "igw_tags"{
   type = map
   default = {
    Name = "igwbh"
   }
}

variable "public_subnet_tags"{
 type = map
 default = {
   Name = "public_subnet_bh"
   Environment = "DEV"
   Terraform = "true"
 }
}

variable "private_subnet_tags" {
    type = map
    default = {
      Name = "private_subnet_bh"
      Environment = "DEV"
      Terraform = "true"
    }
}

variable "public_routetable_tags" {
    type = map
    default = {
      Name = "public_routetable_bh"
      Environment = "DEV"
      Terraform = "true"
    }
}

variable "nat_tags" {
    type = map
    default = {
      Name = "nat_bh"
      Environment = "DEV"
      Terraform = "true"
    }
}

variable "private_routetable_tags" {
    type = map
    default = {
      Name = "private_routetable_bh"
      Environment = "DEV"
      Terraform = "true"
    }
}


variable "database_subnet_tags" {
    type = map
    default = {
      Name = "database_subnet_bh"
      Environment = "DEV"
      Terraform = "true"
    }
}