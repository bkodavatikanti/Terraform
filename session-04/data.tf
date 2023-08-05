data "aws_ami" "ami_info"{
    most_recent      = true
    owners           = [var.aws_accounts[data.aws_region.current.name]] # this is the official amazon account ID itself

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

output "vpc_info" {
 value = data.aws_vpc.existing_vpc
}