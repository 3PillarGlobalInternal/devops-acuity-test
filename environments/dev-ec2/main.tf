terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    # bucket name where to keep terraform state file
    bucket  = "medevops-terraforms-pocs-us-east-1"
    profile = "default"
    encrypt = "true"
    key     = "ec2_sql/terraform_state"
    region  = "us-east-1"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}

module "ec2_sql" {
  source = "../../modules/ec2"
  ami_id = "ami-0e329feef66084519"
  instance_type = "t2.xlarge"
}