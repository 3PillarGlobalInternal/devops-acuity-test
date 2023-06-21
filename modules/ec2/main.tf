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

  user_data = <<EOF
<powershell>
$IsoPath = "https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso"
md "C:\ISO-FILEs\"
$ImagePath = "C:\ISO-FILEs\SQLServer2019-x64-ENU-Dev.iso"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($IsoPath, $ImagePath)
$volume = Mount-DiskImage $ImagePath -StorageType ISO -PassThru | Get-Volume
$sqladmin = "sql_admin"
$sqladmin_password = "${var.sql_admin_password}"
New-LocalUser -Name $sqladmin -NoPassword
$securedPassword = ConvertTo-SecureString -String $sqladmin_password -AsPlainText -Force
Set-LocalUser -Name $sqladmin -Password $securedPassword
$sqlservice = "sql_service"
$sqlservice_password = "${var.sql_service_password}"
New-LocalUser -Name $sqlservice -NoPassword
$securedPassword = ConvertTo-SecureString -String $sqlservice_password -AsPlainText -Force
Set-LocalUser -Name $sqlservice -Password $securedPassword
$SystemAdminAccounts = @("$Env:COMPUTERNAME\Administrator","$Env:COMPUTERNAME\$sqladmin")
$Features = @('SQLEngine')
$sa_password = "${var.sql_sa_password}"
Start-Process powershell.exe -Verb RunAs
$cmd =@(
    "$volume.DriveLetter:\setup.exe"
    '/Q'                                # Silent install
    '/INDICATEPROGRESS'                 # Specifies that the verbose Setup log file is piped to the console
    '/IACCEPTSQLSERVERLICENSETERMS'     # Must be included in unattended installations
    '/ACTION=install'                   # Required to indicate the installation workflow
    '/UPDATEENABLED=false'              # Should it discover and include product updates.

    "/FEATURES=" + ($Features -join ',')

    #Security
    "/SQLSYSADMINACCOUNTS=""$SystemAdminAccounts"""
    '/SECURITYMODE=SQL'                 # Specifies the security mode for SQL Server. By default, Windows-only authentication mode is supported.
    "/SAPWD=""$sa_password"""            # Sa user password

    "/SQLSVCACCOUNT=""$sqlservice"""
    "/SQLSVCPASSWORD=""$sqlservice_password"""

    # Service startup types
    "/SQLSVCSTARTUPTYPE=automatic"
    "/AGTSVCSTARTUPTYPE=automatic"
    "/ASSVCSTARTUPTYPE=manual"
)

Invoke-Expression "$cmd"
Dismount-DiskImage -ImagePath $ImagePath
Restart-Computer
</powershell>
EOF

}



