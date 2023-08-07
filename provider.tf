provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      environment = "Dev-ecs-cluster"
      created_by  = "Terraform"
      created_at  = timestamp()
    }
  }
  assume_role {
    role_arn = "arn:aws:iam::099211283664:role/admin"
  }
}