variable "instances" {
  type = list
  default = ["web-server", "app-server", "db-server"]
}

#if env is test i want to create small instance t3.micro otherwise its prod i want to create t3.large
variable "is_test" {
   type = bool
   default = true  # if the env  is_test is true it will create t3.micro as we mentioned in ec2.tf
}

variable "servers" {
  type = map
  default = {
    "web-server" = "t3.micro"
    "app-server" = "t3.medium"
    "db-server"  = "t3.large"
  }
}

variable "instance_name" {
    type = string
    default = "web-server"
}

variable "environment" {
    type = string
    default = "DEV"
}
