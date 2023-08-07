module "vpc" {
 source = "../terraform-modules/vpc"
 tags = var.tags
 igw_tags = var.igw_tags
 public_subnet_tags = var.public_subnet_tags  #we can overide the module variable values here
 private_subnet_tags = var.private_subnet_tags
 public_routetable_tags = var.public_routetable_tags
 nat_tags = var.nat_tags
 private_routetable_tags = var.private_routetable_tags
 database_subnet_tags = var.database_subnet_tags
}

# As a user you want to create security group

resource "aws_security_group" "websecuritygroup" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id  # you can get the vpc id from the terraform-module outputs.tf

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "securityTimingsbh"
  }
}
