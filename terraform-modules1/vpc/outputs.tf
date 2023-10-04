output "vpc_id" {
 value = aws_vpc.main.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.database.name
}
output "private_subnet_ids" {
    description = "List of IDS of private subnet"
    value = aws_subnet.private[*].id   # this is to get all the private subnet ids
}

output "public_subnet_ids" {
    description = "List of IDS of public subnet"
    value = aws_subnet.public[*].id   # this is to get all the public subnet ids
}
