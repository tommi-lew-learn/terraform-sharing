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
    # tags = {
    #   Project   = "terraform-sharing"
    #   Terraform = true
    #   TerraformStateID = random_id.terraform_state_id.hex
    # }
  }
}

resource "random_id" "terraform_state_id" {
  byte_length = 4
}
