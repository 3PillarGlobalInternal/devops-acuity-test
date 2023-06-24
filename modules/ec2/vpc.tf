# Network Definition 
resource "aws_vpc" "mlink_ec2_vpc" {
  cidr_block = "172.200.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mlink-ec2-vpc"
  }
}

# Public subnets for 2 availability zones
resource "aws_subnet" "mlink_ec2_public_subnet-a" {
  vpc_id            = aws_vpc.mlink_ec2_vpc.id
  cidr_block        = "172.200.0.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-ec2-public-subnet-a"
  }
}

resource "aws_subnet" "mlink_ec2_public_subnet-b" {
  vpc_id            = aws_vpc.mlink_ec2_vpc.id
  cidr_block        = "172.200.48.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mlink-ec2-public-subnet-b"
  }
}

# Private subnets for 2 availability zones
resource "aws_subnet" "mlink_ec2_private_subnet-a" {
  vpc_id            = aws_vpc.mlink_ec2_vpc.id
  cidr_block        = "172.200.16.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-ec2-private-subnet-a"
  }
}

resource "aws_subnet" "mlink_ec2_private_subnet-b" {
  vpc_id            = aws_vpc.mlink_ec2_vpc.id
  cidr_block        = "172.200.64.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mlink-ec2-private-subnet-b"
  }
}

# DB subnets for 2 availability zones
resource "aws_subnet" "mlink_ec2_db_subnet-a" {
  vpc_id            = aws_vpc.mlink_ec2_vpc.id
  cidr_block        = "172.200.32.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mlink-ec2-db-subnet-a"
  }
}

resource "aws_subnet" "mlink_ec2_db_subnet-b" {
  vpc_id            = aws_vpc.mlink_ec2_vpc.id
  cidr_block        = "172.200.80.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mlink-ec2-db-subnet-b"
  }
}

# VPC Route tables
resource "aws_route_table" "mlink_ec2_public_rt" {
  vpc_id = aws_vpc.mlink_ec2_vpc.id
  tags = {
    Name = "mlink-ec2-public-rt"
  }
}

resource "aws_route_table" "mlink_ec2_private_rt" {
  vpc_id = aws_vpc.mlink_ec2_vpc.id
  tags = {
    Name = "mlink-ec2-private-rt"
  }
}

resource "aws_route_table" "mlink_ec2_db_rt" {
  vpc_id = aws_vpc.mlink_ec2_vpc.id
  tags = {
    Name = "mlink-ec2-db-rt"
  }
}

# Public subnets route table association
resource "aws_route_table_association" "public_rt_a" {
  subnet_id = aws_subnet.mlink_ec2_public_subnet-a.id
  route_table_id = aws_route_table.mlink_ec2_public_rt.id
}
resource "aws_route_table_association" "public_rt_b" {
  subnet_id = aws_subnet.mlink_ec2_public_subnet-b.id
  route_table_id = aws_route_table.mlink_ec2_public_rt.id
}

# Private subnets route table association
resource "aws_route_table_association" "private_rt_a" {
  subnet_id = aws_subnet.mlink_ec2_private_subnet-a.id
  route_table_id = aws_route_table.mlink_ec2_private_rt.id
}
resource "aws_route_table_association" "private_rt_b" {
  subnet_id = aws_subnet.mlink_ec2_private_subnet-b.id
  route_table_id = aws_route_table.mlink_ec2_private_rt.id
}

# DB subnets route table association
resource "aws_route_table_association" "db_rt_a" {
  subnet_id = aws_subnet.mlink_ec2_db_subnet-a.id
  route_table_id = aws_route_table.mlink_ec2_db_rt.id
}
resource "aws_route_table_association" "db_rt_b" {
  subnet_id = aws_subnet.mlink_ec2_db_subnet-b.id
  route_table_id = aws_route_table.mlink_ec2_db_rt.id
}

# Internet Gateway Definition
resource "aws_internet_gateway" "mlink_ec2_igw_01" {
  vpc_id = aws_vpc.mlink_ec2_vpc.id
  tags = {
    Name = "mlink-ec2-igw"
  }
}

# Internet Route for public subnets
resource "aws_route" "mlink_ec2_internet_rt_01" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.mlink_ec2_public_rt.id
  gateway_id = aws_internet_gateway.mlink_ec2_igw_01.id
}
