resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = merge(
        var.tags,
        var.security_group_tags,
        {"Name"= var.security_group_name}  # it will override the name varible from the above tags name varibale

    ) 

}

# This rule will add ingress rules to the above security group
resource "aws_security_group_rule" "ingress_with_cidr" {  # this is a resource differnet from above to add ingress rules to the existing security groups.
  count = length(var.ingress_cidr)
  type = "ingress"
  from_port = lookup(var.ingress_cidr[count.index],"from_port")  # it will take the index as 1 if we provide a variable in variables.tf
  to_port = lookup(var.ingress_cidr[count.index],"to_port")
  cidr_blocks = [lookup (var.ingress_cidr[count.index],"cidr_block")]
  description = lookup (var.ingress_cidr[count.index],"description")
  protocol = "6" #custom TCP default number is 6
  security_group_id = aws_security_group.main.id

}