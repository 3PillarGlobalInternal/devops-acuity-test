# Network Definition 
resource "aws_vpc" "mlink_vpc" {
  cidr_block = "172.200.0.0/16"
  tags = {
    Name = "mlink-vpc"
  }
}

# Public subnets for 3 availability zones
resource "aws_subnet" "mlink_public_subnet-a" {
  vpc_id            = aws_vpc.mlink_vpc.id
  cidr_block        = "172.200.0.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-public-subnet-a"
  }
}

# Private subnets for 3 availability zones
resource "aws_subnet" "mlink_private_subnet-a" {
  vpc_id            = aws_vpc.mlink_vpc.id
  cidr_block        = "172.200.16.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-private-subnet-a"
  }
}

# DB subnets for 3 availability zones
resource "aws_subnet" "mlink_db_subnet-a" {
  vpc_id            = aws_vpc.mlink_vpc.id
  cidr_block        = "172.200.32.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-db-subnet-a"
  }
}

# VPC Route tables
resource "aws_route_table" "mlink_public_rt" {
  vpc_id = aws_vpc.mlink_vpc.id
  tags = {
    Name = "mlink-public-rt"
  }
}

resource "aws_route_table" "mlink_private_rt" {
  vpc_id = aws_vpc.mlink_vpc.id
  tags = {
    Name = "mlink-private-rt"
  }
}

resource "aws_route_table" "mlink_db_rt" {
  vpc_id = aws_vpc.mlink_vpc.id
  tags = {
    Name = "mlink-db-rt"
  }
}

# Public subnets route table association
resource "aws_route_table_association" "public_rt_a" {
  subnet_id = aws_subnet.mlink_public_subnet-a.id
  route_table_id = aws_route_table.mlink_public_rt.id
}

# Private subnets route table association
resource "aws_route_table_association" "private_rt_a" {
  subnet_id = aws_subnet.mlink_private_subnet-a.id
  route_table_id = aws_route_table.mlink_private_rt.id
}

# DB subnets route table association
resource "aws_route_table_association" "db_rt_a" {
  subnet_id = aws_subnet.mlink_db_subnet-a.id
  route_table_id = aws_route_table.mlink_db_rt.id
}

# Internet Gateway Definition
resource "aws_internet_gateway" "mlink_igw_01" {
  vpc_id = aws_vpc.mlink_vpc.id
  tags = {
    Name = "mlink-igw"
  }
}

# Internet Route for public subnets
resource "aws_route" "mlink_internet_rt_01" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.mlink_public_rt.id
  gateway_id = aws_internet_gateway.mlink_igw_01.id
}
