# Network Definition 
resource "aws_vpc" "mlink_rds_vpc" {
  cidr_block = "172.201.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mlink-rds-vpc"
  }
}

# Public subnets for 2 availability zones
resource "aws_subnet" "mlink_rds_public_subnet-a" {
  vpc_id            = aws_vpc.mlink_rds_vpc.id
  cidr_block        = "172.201.0.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-rds-public-subnet-a"
  }
}

resource "aws_subnet" "mlink_rds_public_subnet-b" {
  vpc_id            = aws_vpc.mlink_rds_vpc.id
  cidr_block        = "172.201.48.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mlink-rds-public-subnet-b"
  }
}

# Private subnets for 2 availability zones
resource "aws_subnet" "mlink_rds_private_subnet-a" {
  vpc_id            = aws_vpc.mlink_rds_vpc.id
  cidr_block        = "172.201.16.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-rds-private-subnet-a"
  }
}

resource "aws_subnet" "mlink_rds_private_subnet-b" {
  vpc_id            = aws_vpc.mlink_rds_vpc.id
  cidr_block        = "172.201.64.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mlink-rds-private-subnet-b"
  }
}

# DB subnets for 2 availability zones
resource "aws_subnet" "mlink_rds_db_subnet-a" {
  vpc_id            = aws_vpc.mlink_rds_vpc.id
  cidr_block        = "172.201.32.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-rds-db-subnet-a"
  }
}

resource "aws_subnet" "mlink_rds_db_subnet-b" {
  vpc_id            = aws_vpc.mlink_rds_vpc.id
  cidr_block        = "172.201.80.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mlink-rds-db-subnet-b"
  }
}

# VPC Route tables
resource "aws_route_table" "mlink_rds_public_rt" {
  vpc_id = aws_vpc.mlink_rds_vpc.id
  tags = {
    Name = "mlink-rds-public-rt"
  }
}

resource "aws_route_table" "mlink_rds_private_rt" {
  vpc_id = aws_vpc.mlink_rds_vpc.id
  tags = {
    Name = "mlink-rds-private-rt"
  }
}

resource "aws_route_table" "mlink_rds_db_rt" {
  vpc_id = aws_vpc.mlink_rds_vpc.id
  tags = {
    Name = "mlink-rds-db-rt"
  }
}

# Public subnets route table association
resource "aws_route_table_association" "public_rt_a" {
  subnet_id = aws_subnet.mlink_rds_public_subnet-a.id
  route_table_id = aws_route_table.mlink_rds_public_rt.id
}
resource "aws_route_table_association" "public_rt_b" {
  subnet_id = aws_subnet.mlink_rds_public_subnet-b.id
  route_table_id = aws_route_table.mlink_rds_public_rt.id
}

# Private subnets route table association
resource "aws_route_table_association" "private_rt_a" {
  subnet_id = aws_subnet.mlink_rds_private_subnet-a.id
  route_table_id = aws_route_table.mlink_rds_private_rt.id
}
resource "aws_route_table_association" "private_rt_b" {
  subnet_id = aws_subnet.mlink_rds_private_subnet-b.id
  route_table_id = aws_route_table.mlink_rds_private_rt.id
}

# DB subnets route table association
resource "aws_route_table_association" "db_rt_a" {
  subnet_id = aws_subnet.mlink_rds_db_subnet-a.id
  route_table_id = aws_route_table.mlink_rds_db_rt.id
}
resource "aws_route_table_association" "db_rt_b" {
  subnet_id = aws_subnet.mlink_rds_db_subnet-b.id
  route_table_id = aws_route_table.mlink_rds_db_rt.id
}

# Internet Gateway Definition
resource "aws_internet_gateway" "mlink_rds_igw_01" {
  vpc_id = aws_vpc.mlink_rds_vpc.id
  tags = {
    Name = "mlink-rds-igw"
  }
}

# Internet Route for public subnets
resource "aws_route" "mlink_rds_internet_rt_01" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.mlink_rds_public_rt.id
  gateway_id = aws_internet_gateway.mlink_rds_igw_01.id
}
