resource "aws_launch_template" "sql_poc_lt" {
  name = "SQL-POC-WindowsServerCoreCustom"
  description = "This launch tamplate create a sql instance using a windows server core base and powershell user data"
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
  
  tags = {
    "Name" = "Acuity-POC"
  }
}

resource "aws_instance" "sql_srv01" {
  launch_template {
    id = aws_launch_template.sql_poc_lt.id
    version = aws_launch_template.sql_poc_lt.latest_version
  }
  subnet_id = var.public_subnet_id
  tags = {
    "Name" = "Acuity-POC"
  }
  security_groups = [var.security_group_id]

}



