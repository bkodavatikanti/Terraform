resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "automated-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id # it will fetch vpc id created from above code.
  cidr_block = "10.0.1.0/24"
 
  tags = {
    Name = "publice subnet of automated-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id # it will fetch vpc id created from above code.
  cidr_block = "10.0.2.0/24"
 
  tags = {
    Name = "private subnet of automated-vpc"
  }
}


resource "aws_internet_gateway" "Automated-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "automated-igw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Automated-igw.id
  }

  tags = {
    Name = "public-rt"
  }
}
resource "aws_eip" "auto-elastic-ip" {
}

resource "aws_nat_gateway" "automated-NAT" {
  allocation_id = aws_eip.auto-elastic-ip.id
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "automated NAT"
  }
depends_on = [aws_internet_gateway.Automated-igw]
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.automated-NAT.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}
