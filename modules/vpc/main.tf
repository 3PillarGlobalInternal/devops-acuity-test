#Network Definition 
resource "aws_vpc" "sql_poc" {
  cidr_block = "172.200.0.0/16"

  tags = {
    Name = "Acuity-POC"
  }
}

resource "aws_subnet" "poc_private_subnet" {
  vpc_id            = aws_vpc.sql_poc.id
  cidr_block        = "172.200.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Acuity-POC"
  }
}

resource "aws_subnet" "poc_public_subnet" {
  vpc_id            = aws_vpc.sql_poc.id
  cidr_block        = "172.200.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Acuity-POC"
  }
}

resource "aws_route_table" "poc_rt" {
  vpc_id = aws_vpc.sql_poc.id
  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_route_table_association" "public_rt" {
  subnet_id = aws_subnet.poc_public_subnet.id
  route_table_id = aws_route_table.poc_rt.id
}

resource "aws_route_table_association" "private_rt" {
  subnet_id = aws_subnet.poc_private_subnet.id
  route_table_id = aws_route_table.poc_rt.id
}

resource "aws_internet_gateway" "poc_igw" {
  vpc_id = aws_vpc.sql_poc.id
  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_route" "poc_internet_rt" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.poc_rt.id
  gateway_id = aws_internet_gateway.poc_igw.id
}
