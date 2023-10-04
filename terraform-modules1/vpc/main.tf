#createvpc
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr # users must provide his own CIDR.
  enable_dns_hostnames = true
  enable_dns_support = true
  tags =  merge (                 # we should merge common tags and vpc tags
    var.tags,
    var.vpc_tags
  )              
}

# we need to create IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge (                 # we should merge common tags and igw tags
    var.tags,
    var.igw_tags
  )           
}

# create publicsubnets in 1a and 1b, publicroute table, routes and association between subnet and route table
# here we need to create 2 subnets
resource "aws_subnet" "public" {
  count = length (var.public_subnet_cidr) #count=2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  # count.index will start with 0 index and take the first name as value in
  # in 1st iteration. ex:
  #public_subnet_name = var.public_subnet_names[count.index]
  tags = merge (
    var.tags,
    var.public_subnet_tags,
    {"Name" = var.public_subnet_names[count.index] } # this is the unique name 
     # for each subnet 
     # here merge  function will merge all the common tags into one. ex: environment = dev
     # terraform = true , here in above code we define public_subnet_name also . so the output we can see
     # when we merge all this is dev,true,timing-publicbh-1a
  )      
}

# aws public route table

resource "aws_route_table" "public" {     # one route table per subnet
  vpc_id = aws_vpc.main.id
  tags =  merge (                 
    var.tags,
    var.public_route_table_tags,
    {"Name" = var.public_route_table_name}
  )     
}

resource "aws_route" "public" {               #public routes to route table
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id # this will fetch the igwid 
}

# associate route table with public subnets. we have 1 route table that should be associated to
# 2 subnets

resource "aws_route_table_association" "public" {
  count = length (var.public_subnet_cidr)
  subnet_id      = element (aws_subnet.public[*].id,count.index) # it will fetch the subnet id of index 0 and index1
  route_table_id = aws_route_table.public.id
}

#private subnet

resource "aws_subnet" "private" {
  count = length (var.private_subnet_cidr) #count=2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  # count.index will start with 0 index and take the first name as value in
  # in 1st iteration. ex:
  #public_subnet_name = var.public_subnet_names[count.index]
  tags = merge (
    var.tags,
    var.private_subnet_tags,
    {"Name" = var.private_subnet_names[count.index] } # this is the unique name 
  )      
}

#here the route is natgatway

resource "aws_eip" "main" {
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id  # hence the public ips are list i.e 2 . we will assign the fits index[0]

  tags =  merge (                 
    var.tags,
    var.igw_tags
  )  

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

#privateroute table tags

resource "aws_route_table" "private" {     # one route table per subnet
  vpc_id = aws_vpc.main.id
  tags =  merge (                 
    var.tags,
    var.private_route_table_tags,
    {"Name" = var.private_route_table_name}
  )     
}

#private routes to private routetable
resource "aws_route" "private" {               #private routes to route table
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.main.id # this will fetch the igwid 
}

resource "aws_route_table_association" "private" {
  count = length (var.private_subnet_cidr)
  subnet_id      = element (aws_subnet.private[*].id,count.index) # it will fetch the subnet id of index 0 and index1
  route_table_id = aws_route_table.private.id
}

resource "aws_subnet" "database" {
  count = length (var.database_subnet_cidr) #count=2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  # count.index will start with 0 index and take the first name as value in
  # in 1st iteration. ex:
  tags = merge (
    var.tags,
    var.database_subnet_tags,
    {"Name" = var.database_subnet_names[count.index]} # this is the unique name 
  )      
}

resource "aws_route_table" "database" {     # one route table per subnet
  vpc_id = aws_vpc.main.id
  tags =  merge (                 
    var.tags,
    var.database_route_table_tags,
    {"Name" = var.database_route_table_name}
  )     
}

resource "aws_route" "database" {               #private routes to route table
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.main.id # this will fetch the igwid 
}

resource "aws_route_table_association" "database" {
  count = length (var.database_subnet_cidr)
  subnet_id      = element (aws_subnet.database[*].id,count.index) # it will fetch the subnet id of index 0 and index1
  route_table_id = aws_route_table.database.id
}

#database subnet group
resource "aws_db_subnet_group" "database" {
  #name       = "main"
  name = lookup (var.tags,"Name")
  subnet_ids = aws_subnet.database[*].id

  tags = merge (
    var.tags,
    var.database_subnet_group_tags,
  )   
}