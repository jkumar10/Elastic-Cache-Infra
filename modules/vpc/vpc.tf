# Internet VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = var.name
  }
}
resource "aws_subnet" "app-public-1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr-public-1
  map_public_ip_on_launch = "true"
  availability_zone       = var.public-1-az

  tags = {
    Name = "app-public-1"
  }
}

resource "aws_subnet" "app-public-2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr-public-2
  map_public_ip_on_launch = "true"
  availability_zone       = var.public-2-az

  tags = {
    Name = "app-public-2"
  }
}
resource "aws_subnet" "app-private-1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr-private-1
  map_public_ip_on_launch = "false"
  availability_zone       = var.private-1-az

  tags = {
    Name = "app-private-1"
  }
}

resource "aws_subnet" "app-private-2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr-private-2
  map_public_ip_on_launch = "false"
  availability_zone       = var.private-2-az

  tags = {
    Name = "app-private-2"
  }
}

resource "aws_subnet" "app-private-3" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr-private-3
  map_public_ip_on_launch = "false"
  availability_zone       = var.private-3-az

  tags = {
    Name = "app-private-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "app-gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "app-gw"
  }
  }

# route tables
resource "aws_route_table" "app-public-rt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-gw.id
  }

  tags = {
    Name = "app-public-rt"
  }
}

# route associations public
resource "aws_route_table_association" "app-public-1-association" {
  subnet_id      = aws_subnet.app-public-1.id
  route_table_id = aws_route_table.app-public-rt.id
}

resource "aws_route_table_association" "app-public-2-association" {
  subnet_id      = aws_subnet.app-public-2.id
  route_table_id = aws_route_table.app-public-rt.id
}
