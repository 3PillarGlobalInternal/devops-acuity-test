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

resource "aws_security_group" "ec2_sql_sg" {
  name = "ec2_sql_sg"
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = aws_vpc.sql_poc.id

  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_iam_role" "ec2_basic_role" {
  name = "sqlpoc-iamec2basicrole"

 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "ec2_basic_role_policy_attachment" {
  name = "SSM Policy Attachement"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  roles       = [aws_iam_role.ec2_basic_role.name]
}
resource "aws_iam_instance_profile" "ec2_sql_poc_iprofile" {
  name = "sql-poc-ec2-iprofile"
  role = aws_iam_role.ec2_basic_role.name
}
resource "aws_launch_template" "sql_poc_lt" {
  name = "SQL-POC-WindowsServerCoreCustom"
  description = "This launch tamplate create a sql instance using a windows server core base and powershell user data"
  image_id = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_sql_poc_iprofile.name
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 100
    }
  }
  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_network_interface" "sql_srv01_int" {
  subnet_id = aws_subnet.poc_public_subnet.id
  security_groups = [aws_security_group.ec2_sql_sg.id]
  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_eip" "sql_srv01_eip" {
  vpc = true
  network_interface = aws_network_interface.sql_srv01_int.id
  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_instance" "sql_srv01" {
  launch_template {
    id = aws_launch_template.sql_poc_lt.id
    version = aws_launch_template.sql_poc_lt.latest_version
  }
  network_interface {
    network_interface_id = aws_network_interface.sql_srv01_int.id
    device_index         = 0
  }
  tags = {
    "Name" = "Acuity-POC"
  }
}



