output "ec2_sql_instane_public_ip" {
  value = aws_instance.sql_srv01.public_ip
}