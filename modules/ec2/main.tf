resource "aws_launch_template" "mlink_sql_instance" {
  name = "MLINK-SQL-POC"
  image_id = var.ami_id
  instance_type = var.instance_type

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 100
    }
  }
  network_interfaces {
    associate_public_ip_address = true
  }
}

resource "aws_security_group" "ec2_sql_instance_sg" {
  name = "sql_poc_sg"
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
  vpc_id = aws_vpc.mlink_ec2_vpc.id
  depends_on = [ aws_route.mlink_ec2_internet_rt_01 ]
}

resource "aws_instance" "sql_srv01" {
  launch_template {
    id = aws_launch_template.mlink_sql_instance.id
    version = aws_launch_template.mlink_sql_instance.latest_version
  }
  subnet_id = aws_subnet.mlink_ec2_public_subnet-a.id
  security_groups = [aws_security_group.ec2_sql_instance_sg.id]
  tags = {
    Name = "mlink-sql-srv01"
  }
  depends_on = [ aws_security_group.ec2_sql_instance_sg ]

}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 300"  
  }
  depends_on = [aws_instance.sql_srv01]
}

resource "null_resource" "execute_sql" {
  provisioner "local-exec" {
    command = "sqlcmd -U ${var.ec2_sql_user} -S ${aws_instance.sql_srv01.public_ip},1433 -i ../../modules/ec2/dump_db.sql"
  }
  provisioner "local-exec" {
    command = "sleep 300"  
  }
  depends_on = [null_resource.wait]
}

