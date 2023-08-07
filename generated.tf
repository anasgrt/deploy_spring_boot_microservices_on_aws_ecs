# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "users-microservice"
resource "aws_ecr_repository" "service" {
  force_delete         = null
  image_tag_mutability = "MUTABLE"
  name                 = "users-microservice"
  tags = {
    created_at  = "2023-08-07T19:11:51Z"
    created_by  = "Terraform"
    environment = "Dev-ecs-spring_app"
  }
  tags_all = {
    created_at  = "2023-08-07T19:11:51Z"
    created_by  = "Terraform"
    environment = "Dev-ecs-spring_app"
  }
  encryption_configuration {
    encryption_type = "AES256"
    kms_key         = null
  }
  image_scanning_configuration {
    scan_on_push = true
  }
}
