### MODULES

As infra engineer you develop modules, So that other developers or anyone else can use in your organisation.

## INPUTS

* vpc_cidr (required) - user should provide VPC CIDR
* tags(required) - user should provide tags
* vpc_tags (optional) - These are optional
* Azs (required) -  user should provide 2 azs a list
* public_subnet_cidr(required) -user should provide a list of 2 public_cidr
* public_subnet_tags(optional) -- these are optional and user can provide public subnet tags
* public_subnet_names(required) -- user should provide 2 public_subnet_names same as they provide for public subnet cidr
* igw_tags(optional) = users can provide igw tags.
* public_route_table_tags(optional) - user can provide public route table tags.
* public_route_table_name(required) - user should provide public route tabe name
* private_subnet_cidr (required) - user should provide a list of 2 private_cidr
* private_subnet_tags(optional)- users can provide private subnet tags
* private_subnet_names(requi red) - users should provide private subnet names.
* natgateway_tags (optional)- users can provide internetgatway tags
* public_route_table_tags (optional)- users can provide public_route_table_tags
* public_route_table_name(required) - users should provide public_route_table_tags
* database_subnet_cidr (required) - user should provide a list of 2 database_cidr
* database_subnet_tags(optional)- users can provide database subnet tags
* database_subnet_names(requi red) - users should provide database subnet names.
* database_route_table_name (required) - users should provide database routetable name
* database_route_table_tags (optional) - users can provide database route table tags.
* database_subnet_group_tag (optional) - users can provide database_subnet_group_tag.

