terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Project   = "terraform-sharing"
      Terraform = true
    }
  }
}
