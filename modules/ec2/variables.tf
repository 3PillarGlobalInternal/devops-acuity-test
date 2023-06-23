
variable "ami_id" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "vpc_id" {
  type    = string
}

variable "public_subnet_id" {
  type    = string
}

variable "ec2_sql_user" {
  type    = string
}

variable "ec2_sql_password" {
  type    = string
}