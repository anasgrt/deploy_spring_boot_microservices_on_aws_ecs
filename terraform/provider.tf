provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      environment = "Dev"
      created_by = "Terraform"
    }
  }

  assume_role {
    role_arn = "arn:aws:iam::099211283664:role/admin"
  }
}