terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    # bucket name where to keep terraform state file
    bucket  = "terraform-poc-us-east-1"
    profile = "default"
    encrypt = "true"
    key     = "ec2_sql/terraform_state"
    region  = "us-east-1"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project = "mlink-melm-poc"
      env = "sandbox"
    }
  }
}

module "ec2_sql" {
  source = "../../modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  ec2_sql_user = var.ec2_sql_user
  ec2_sql_password = var.ec2_sql_password
}

