terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    # bucket name where to keep terraform state file
    bucket  = "terraforms-pocs"
    profile = "default"
    encrypt = "true"
    key     = "populate_db/terraform_state"
    region  = "us-east-1"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}

module "mysql_rds" {
  source = "../../modules/rds"

  # db_name     = "my_dev_db"
  # instance_id = "dev-mysql-rds"
  admin_user = var.admin_user
  admin_pass = var.admin_pass

}