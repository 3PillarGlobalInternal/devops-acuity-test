output "public_subnet_id" {
  value = aws_subnet.poc_public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.ec2_sql_sg.id
}