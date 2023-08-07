#this will create vpc
# resource "aws_vpc" "this" {
#    cidr_block       = var.cidr #allowing others to override
#    instance_tenancy = "default"
# }

resource "aws_vpc" "this" {
   #local variables will not allow users to define their own values. 
   cidr_block       = local.cidr #As an infr engineer and module developer you dont want users to create cidr with different value.
   instance_tenancy = "default"
   # where as variables will allow users to define their values.
   tags = var.tags               # This says module developer give access to users to create their own tags. if user dont give any tags then default values in this module may applied.
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id # internet gate way for vpc
   tags = var.igw_tags
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id # it will fetch vpc id created from above code.
  cidr_block = "10.0.1.0/24"
  tags = var.public_subnet_tags
}

resource "aws_subnet" "private" {  #syntax is "resource" "yournameto the resource"
  vpc_id     = aws_vpc.this.id # it will fetch vpc id created from above code.
  cidr_block = "10.0.2.0/24"
  tags = var.private_subnet_tags
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.public_routetable_tags
}

resource "aws_eip" "elastic-ip" {
}

resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public.id
  tags = var.nat_tags
depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT.id
  }

  tags = var.private_routetable_tags
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}


resource "aws_subnet" "Database" {
  vpc_id     = aws_vpc.this.id # it will fetch vpc id created from above code.
  cidr_block = "10.0.3.0/24"
  tags = var.database_subnet_tags
}