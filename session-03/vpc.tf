resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = merge(var.tags, {
    Name = "Timings"
  })
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id # it will fetch vpc id created from above code.
  cidr_block = var.public_subnet_cidr
 
  tags = merge(var.tags, {
    Name = "public-subnet"
  })
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id # it will fetch vpc id created from above code.
  cidr_block = var.private_subnet_cidr
 
  tags = merge(var.tags, {
    Name = "private-subnet"
  })
}


resource "aws_internet_gateway" "Automated-igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags, {
    Name = "Timing-IGW"
  })
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.internet-cidr
    gateway_id = aws_internet_gateway.Automated-igw.id
  }

  tags = merge(var.tags, {
    Name = "public-routetable"
  })
}
resource "aws_eip" "auto-elastic-ip" {
}

resource "aws_nat_gateway" "automated-NAT" {
  allocation_id = aws_eip.auto-elastic-ip.id
  subnet_id     = aws_subnet.public.id

  tags = merge(var.tags, {
    Name = "Timing-natgateway"
  })
depends_on = [aws_internet_gateway.Automated-igw]
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.internet-cidr
    gateway_id = aws_nat_gateway.automated-NAT.id
  }

  tags = merge(var.tags, {
    Name = "private-routetable"
  })
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}
