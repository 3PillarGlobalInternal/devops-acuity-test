#create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = aws_vpc.mlink_rds_vpc.id
  depends_on = [ aws_route.mlink_rds_internet_rt_01 ]
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.mlink_rds_public_subnet-a.id, aws_subnet.mlink_rds_public_subnet-b.id]

  tags = {
    Name = "My DB subnet group"
  }
  depends_on = [ aws_security_group.rds_sg ]
}


#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  # name                   = var.db_name
  engine                 = "sqlserver-ex"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "14.00.3451.2.v1"
  instance_class         = "db.t2.micro"
  username               = var.admin_user
  password               = var.admin_pass
  # parameter_group_name   = "default.mssql"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  port = 1433
  skip_final_snapshot    = true
  publicly_accessible    = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  depends_on = [ aws_db_subnet_group.rds_subnet_group ]
}

resource "null_resource" "execute_sql" {
  provisioner "local-exec" {
    command = "sqlcmd -U ${var.admin_user} -S ${aws_db_instance.myinstance.address},${aws_db_instance.myinstance.port} -i ../../modules/rds/dump_db.sql"
  }
  depends_on = [aws_db_instance.myinstance]
}

