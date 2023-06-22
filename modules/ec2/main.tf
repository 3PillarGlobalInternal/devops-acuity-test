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
    arn = aws_iam_instance_profile.ec2_sql_poc_iprofile.arn
  }
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 100
    }
  }
  network_interfaces {
    associate_public_ip_address = true
  }
  
  tags = {
    "Name" = "Acuity-POC"
  }
}


resource "aws_instance" "sql_srv01" {
  launch_template {
    id = aws_launch_template.sql_poc_lt.id
    version = aws_launch_template.sql_poc_lt.latest_version
  }
  subnet_id = aws_subnet.poc_public_subnet.id
  tags = {
    "Name" = "Acuity-POC"
  }
  security_groups = [aws_security_group.ec2_sql_sg.id]

}



