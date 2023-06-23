output "vpc_id" {
  value = aws_vpc.mlink_vpc.id
}

output "public_subnet_a_id" {
  value = aws_subnet.mlink_public_subnet-a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.mlink_public_subnet-b.id
}

output "public_subnet_c_id" {
  value = aws_subnet.mlink_public_subnet-c.id
}

output "private_subnet_a_id" {
  value = aws_subnet.mlink_private_subnet-a.id
}

output "private_subnet_b_id" {
  value = aws_subnet.mlink_private_subnet-b.id
}

output "private_subnet_c_id" {
  value = aws_subnet.mlink_private_subnet-c.id
}

output "db_subnet_a_id" {
  value = aws_subnet.mlink_db_subnet-a.id
}

output "db_subnet_b_id" {
  value = aws_subnet.mlink_db_subnet-b.id
}

output "db_subnet_c_id" {
  value = aws_subnet.mlink_db_subnet-c.id
}