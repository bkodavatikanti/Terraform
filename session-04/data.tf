data "aws_ami" "ami_info"{
    most_recent      = true
    #owners           = [var.aws_accounts[data.aws_region.current.name]] # this is the official amazon account ID itself
    owners = [lookup(var.aws_accounts,data.aws_region.current.name)]
    #lookup (map, key, default) if you provide key it will fetch value from a map. if that key is not available
    #then you provide default key . in the above example data.aws_region.current has the ap-south-1 as key
    #it will fetch the data from the below code.
     
    filter { 
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*-20230517"]

  }

 filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# i want to fetch which region im in

data "aws_region" "current" {}

# i want to get the vpc information of an existing vpc

data "aws_vpc" "existing_vpc" {
  id = "vpc-081168e3e57c911a3"
}

# output "vpc_info" {
#   value = data.aws_vpc.existing_vpc
#  }